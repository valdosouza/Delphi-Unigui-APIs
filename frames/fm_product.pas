unit fm_product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniGUIApplication, uniPanel;

type
  TFmProduct = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmProduct: TFmProduct;

implementation

{$R *.dfm}

uses MainModule, openForms, sea_product, cad_product;

procedure TFmProduct.Listar;
begin
  cds_search.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               ' Select pr.id, pr.description '+
               ' from tb_product pr ',
               ' WHERE (pr.tb_institution_id =:tb_institution_id ) ',
               ' order by pr.description'
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmProduct.Sb_RegisterClick(Sender: TObject);
var
  Form : TCadProduct;
begin
  if Form = nil then
    Form := TCadProduct.Create(UniApplication);
  Form.CodigoRegistro := 0;
  if (DBLCB_Lista.KeyValue <> null) then
    Form.CodigoRegistro :=  DBLCB_Lista.KeyValue;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      DBLCB_Lista.KeyValue := form.cds_msgid.AsInteger;
      Form := nil;
    end
  );
end;

procedure TFmProduct.Sb_SearchClick(Sender: TObject);
Var
  Form : TSeaProduct;
begin
  if Form = nil then
    Form := TSeaProduct.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      DBLCB_Lista.KeyValue := form.cds_search.fieldByName('id').AsInteger;
      Form := nil;
    end
  );
end;

end.
