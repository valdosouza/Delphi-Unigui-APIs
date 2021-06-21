unit sea_interation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, base_search, base_frame, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, MainModule,
  uniGUIApplication, Datasnap.DBClient, Datasnap.Provider, uniPageControl;

type
  TSeaInteration = class(TBaseSearch)
    Sb_Atualizar: TUniButton;
    Sb_Interagir: TUniButton;
    cds_searchid: TIntegerField;
    cds_searchtb_order_id: TIntegerField;
    cds_searchupdated_at: TDateTimeField;
    cds_searchuser_name: TStringField;
    cds_searchcomentario: TStringField;
    cds_searchsituacao: TStringField;
    tbs_proposal: TUniTabSheet;
    tbs_task: TUniTabSheet;
    UniTabSheet1: TUniTabSheet;
    procedure Sb_InteragirClick(Sender: TObject);
    procedure Sb_AtualizarClick(Sender: TObject);
    procedure Dbg_searchDblClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    CodigoRegistro : Integer;
    procedure search;

  end;

implementation

{$R *.dfm}

uses cad_interation;

{ TSeaIteration }

procedure TSeaInteration.Dbg_searchDblClick(Sender: TObject);
var
 form : TCadInteration;
begin
 form := TCadInteration.create(UniApplication);
 Form.Iteration.Registro.Codigo           :=  cds_search.fieldByName('id').AsInteger;
 Form.Iteration.Registro.Estabelecimento  :=  UMM.GInstitution.Registro.Codigo;
 Form.Iteration.Registro.Ordem            :=  cds_search.fieldByName('tb_order_id').AsInteger;
 Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form := nil;
    end
  );
end;

procedure TSeaInteration.Sb_AtualizarClick(Sender: TObject);
begin
  inherited;
  search;
end;

procedure TSeaInteration.Sb_InteragirClick(Sender: TObject);
var
 form : TCadInteration;
begin
  form := TCadInteration.create(UniApplication);
  //Informar o master_ID e a Ordem quando for uma resposta na iteração
  with Form.Iteration.HasInteration.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Ordem    := cds_search.FieldByName('tb_order_id').AsInteger;
    MasterId := cds_search.FieldByName('id').AsInteger;
  End;
 Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      self.search;
      form := nil;
    end
  );
end;

procedure TSeaInteration.search;
begin
  cds_search.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
        'select i.id, i.tb_order_id, i.updated_at, u.name_company user_name, i.description comentario, s.description situacao ',
        'from tb_iteration i ',
        '  inner join tb_situation s ',
        '  on (i.tb_situation_id = s.id ) ',
        '    and (i.tb_institution_id = s.tb_institution_id ) ',

        '  inner join tb_order o ',
        '  on (o.id = i.tb_order_id) ',
        '    and (o.tb_institution_id = i.tb_institution_id ) ',

        '  inner join tb_entity u ',
        '  on (u.id = i.tb_user_id) ',

        'where i.tb_institution_id =:tb_institution_id ',
        ' and ( tb_customer_id =:tb_customer_id ) ',
        ' and ( i.tb_order_id =:tb_order_id ) ',
        'order by i.updated_at desc '
    ));
    ParamByName('tb_institution_id').AsInteger := 1;
    ParamByName('tb_customer_id').AsInteger := UMM.Customer;
    ParamByName('tb_order_id').AsInteger := CodigoRegistro;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  Umm.Qr_Crud.close;
end;

end.
