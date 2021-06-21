unit sea_iteration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, base_search, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniPageControl, uniEdit, uniCheckBox, uniDateTimePicker,UnFunctions,fm_customer,
  fm_situation, unmessages,msg_form;

type
  TSeaIteration = class(TBaseSearch)
    ctn_Customer: TUniContainerPanel;
    cds_searchordem: TIntegerField;
    cds_searchiteration: TIntegerField;
    cds_searchupdated_at: TDateTimeField;
    cds_searchcomentario: TStringField;
    cds_searchsituacao: TStringField;
    ctn_Situacao: TUniContainerPanel;
    Sb_Iteration: TUniSpeedButton;
    pnl_param_row_1: TUniPanel;
    pnl_data: TUniPanel;
    chbx_periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    pnl_param_row_2: TUniPanel;
    E_Number: TUniEdit;
    procedure Sb_IterationClick(Sender: TObject);
    procedure pc_searchChange(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
    FrCustomer        : TFmCustomer;
    FrSituation : TFmSituation;

    procedure NovaAba(pOrder:Integer);
    procedure ShowSituation;
    procedure ShowCustomer;
  protected
    procedure FormatScreen;Override;
    procedure InitVariable;Override;
    procedure SetVariable;Override;

    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;

    procedure GetView;Override;
    function validateGetIteration:Boolean;
    procedure GetIteration;



    procedure SetRegister;Override;

  public
    { Public declarations }
    CodigoRegistro : Integer;
  end;
var
  SeaIteration: TSeaIteration;
implementation

{$R *.dfm}

uses MainModule, cad_interation, sea_interation;



{ TSeaIteration }

procedure TSeaIteration.FormatScreen;
begin
  inherited;
  buttonIcon(Sb_Iteration,'iteration.bmp');
  Sb_Iteration.Enabled := pc_search.ActivePageIndex = 1;
  ShowCustomer;
  ShowSituation;
end;


procedure TSeaIteration.GetIteration;
begin
  NovaAba( cds_searchordem.AsInteger );
end;

procedure TSeaIteration.GetView;
var
  form : TCadInteration;
begin
  form := TCadInteration.create(UniApplication);
  Form.kinditeration := '1';
  //Toda Iteração inicial começa com 1
  Form.CodigoRegistro := 1;
  Form.Interation.Registro.Codigo := 1;
  Form.Interation.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  Form.Interation.Registro.Ordem := cds_searchordem.AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );

end;

procedure TSeaIteration.InitVariable;
begin
  inherited;

end;

procedure TSeaIteration.InnerJoinSql;
begin
  InnerJoinTxt := concat(
              '  inner join tb_situation s ',
              '  on (i.tb_situation_id = s.id ) ',
              '    and (i.tb_institution_id = s.tb_institution_id ) ',
              '  inner join tb_order o ',
              '  on (o.id = i.tb_order_id) ',
              '    and (o.tb_institution_id = i.tb_institution_id ) ',
              '  left outer join tb_iteration_has_iteration ihi ',
              '  ON (ihi.tb_iteration_id_detail = i.id ) ',
              '    and (ihi.tb_institution_id = i.tb_institution_id ) ',
              '    and (ihi.tb_order_id = i.tb_order_id ) '
  );

end;

procedure TSeaIteration.NovaAba(pOrder: Integer);
var
  LcTbs   :TUniTabSheet;
  LcPgCount : Integer;
  Form : TSeaInteration;
begin
  LcPgCount := pc_search.PageCount;
  LcTbs := TUniTabSheet.Create(pc_search);
  lcTbs.Name := concat('tbs_', intToStr(LcPgCount));
  lcTbs.Closable := True;
  LcTbs.PageControl := pc_search;
  LcTbs.Caption:= concat('ATENDIMENTO N: ',pOrder.toString) ;
  Form := TSeaInteration.create(LcTbs);
  Form.Parent := LcTbs;
  Form.OrderID    := pOrder;
//  Form.ClienteID  := cds_pOrder;
  Form.search;
  Form.Show;
  pc_search.ActivePage := LcTbs;
  pc_searchChange(Self);
end;

procedure TSeaIteration.OrderBySql;
begin
  OrderByTxt := 'order by  1,2 ';
end;

procedure TSeaIteration.pc_searchChange(Sender: TObject);
begin
  inherited;
  Sb_Iteration.Enabled := ( pc_search.ActivePageIndex = 1 );
end;

procedure TSeaIteration.SelectSql;
begin
  SelectTxt:= concat(
              'select o.id ordem, i.id iteration,  i.updated_at, i.description comentario, ',
              's.description situacao ',
              'from tb_iteration i '
  );

end;

procedure TSeaIteration.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    //ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if ChBx_Periodo.Checked then
    BEgin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_Number.Text <> '' then
      ParamByName('tb_order_id').AsString := E_Number.Text;

    if FrCustomer.DBLCB_Lista.Text <> '' then
      ParamByName('tb_customer_id').AsString := FrCustomer.DBLCB_Lista.KeyValue;

    if FrSituation.DBLCB_Lista.Text <> '' then
      ParamByName('tb_situation_id').AsString := FrSituation.DBLCB_Lista.KeyValue;

  End;
end;

procedure TSeaIteration.SetRegister;
var
 form : TCadInteration;
begin
 form := TCadInteration.create(UniApplication);
 Form.kinditeration := '1';
 Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if form.Interation.Registro.codigo > 0 then
          NovaAba(form.Interation.Registro.Ordem);
      form := nil;
    end
  );
end;

procedure TSeaIteration.SetVariable;
begin
  inherited;

end;

procedure TSeaIteration.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Self);
  FrCustomer.Parent := Ctn_Customer;
  FrCustomer.Align := alClient;
  FrCustomer.listar;
  FrCustomer.Show;
end;

procedure TSeaIteration.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := ctn_Situacao;
  FrSituation.Listar;
  FrSituation.Align := alClient;
  FrSituation.Show;
end;



function TSeaIteration.validateGetIteration: Boolean;
begin
  Result:= True;
  if not validateGetView then
  Begin
    Result:= False;
    exit;
  End;
end;

procedure TSeaIteration.Sb_IterationClick(Sender: TObject);
begin
  if validateGetIteration then
    GetIteration;
end;

procedure TSeaIteration.Sb_SearchClick(Sender: TObject);
begin
  inherited;
  pc_searchChange(pc_search);
end;

procedure TSeaIteration.WhereSql;
begin
  WhereTxt := concat(
              'where ihi.tb_iteration_id_master is null ',
              'and ihi.tb_iteration_id_detail is null ',
              ' and ( i.kind = 1 ) '
  );
  if ChBx_Periodo.Checked then
    WhereTxt := concat(WhereTxt + ' and (o.dt_record between :dataini and :datafim) ');

  if E_Number.Text <> '' then
  Begin
    WhereTxt := concat(WhereTxt,
               'and i.tb_order_id =:tb_order_id '
    );
  End;

  if FrCustomer.DBLCB_Lista.Text <> '' then
  Begin
    WhereTxt := concat(WhereTxt,
               'and i.tb_customer_id =:tb_customer_id '
    );
  End;

  if FrSituation.DBLCB_Lista.Text <> '' then
  Begin
    WhereTxt := concat(WhereTxt,
               'and i.tb_situation_id =:tb_situation_id '
    );
  End;

end;

end.
