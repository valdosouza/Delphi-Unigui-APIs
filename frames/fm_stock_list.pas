unit fm_stock_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,FireDAC.Stan.Param,
  uniSpeedButton, uniGUIBaseClasses, uniGUIClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniLabel, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, uniCheckBox, base_frame_list, uniPanel;

type
  TFmStockList = class(TBaseFrameList)
    chbx_UpdateStock: TUniCheckBox;
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchkind: TStringField;
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
    procedure chbx_UpdateStockClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmStockList: TFmStockList;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TFmStockList }

procedure TFmStockList.chbx_UpdateStockClick(Sender: TObject);
begin
  inherited;
  if chbx_UpdateStock.Checked then
  Begin
    DBLCB_Lista.Enabled := true;
    DBLCB_Lista.KeyValue := DBLCB_Lista.ListSource.DataSet.FieldByName(DBLCB_Lista.KeyField).Value;
  End
  else
  Begin
    DBLCB_Lista.Enabled := False;
    DBLCB_Lista.KeyValue := False;
  End;
end;

procedure TFmStockList.listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
            ' Select distinct sl.id, sl.description, sl.kind ',
            ' from tb_stock_list sl ',
            ' where sl.tb_institution_id =:tb_institution_id ',
            ' order by sl.description '
            ));

    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  DBLCB_Lista.KeyValue := UMM.GInstitution.Estoque;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmStockList.Sb_RegisterClick(Sender: TObject);
begin
  openCadStockList(0,DBLCB_Lista)
end;

procedure TFmStockList.Sb_SearchClick(Sender: TObject);
begin
  openSeaStockList(DBLCB_Lista)
end;

end.
