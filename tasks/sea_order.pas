unit sea_order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniMemo, unimMemo,
  uniDateTimePicker, uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniPanel, uniCheckBox, unimCheckBox;

type
  TSeaOrder = class(TBaseSearch)
    DTP_Date_Initial: TUniDateTimePicker;
    cds_searchdt_record: TDateField;
    cds_searchnote: TBlobField;
    cds_searchid: TAutoIncField;
    DTP_Date_End: TUniDateTimePicker;
    chbx_periodo: TUniCheckBox;
    M_Note: TUniMemo;



    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
    procedure chbx_periodoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaOrder: TSeaOrder;

implementation

{$R *.dfm}

{ TSeaOrder }

uses MainModule, openForms;

procedure TSeaOrder.chbx_periodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := chbx_periodo.Checked;
  DTP_Date_End.Enabled := chbx_periodo.Checked;
end;

procedure TSeaOrder.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadOrder(lcodigo);
end;

procedure TSeaOrder.InnerJoinSql;
begin
  inherited;
//
end;

procedure TSeaOrder.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ord.dt_record ';
end;

procedure TSeaOrder.SelectSql;
begin
  SelectTxt := ' Select distinct ord.id, ord.note, ord.dt_record '+
               ' from tb_order ord ';
end;

procedure TSeaOrder.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := GbInstitution;
    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsDateTime :=  DTP_Date_Initial.DateTime;
      ParamByName('datafim').AsDateTime :=  DTP_Date_End.DateTime;
    End;

    if M_Note.Text <> '' then
      ParamByName('Observacao').AsString := '%' + M_Note.Text + '%' ;
  end;
end;

procedure TSeaOrder.SetRegister;
begin
  openCadOrder(nil);
end;

procedure TSeaOrder.WhereSql;
begin
  inherited;
  WhereTxt := ' where ord.tb_institution_id =:tb_institution_id ';
  if chbx_periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' and (ord.dt_record between :dataini and :datafim)';
  End;

  if M_Note.Text <> '' then
    WhereTxt := WhereTxt + ' and (ord.note like :Observacao)';


end;

end.
