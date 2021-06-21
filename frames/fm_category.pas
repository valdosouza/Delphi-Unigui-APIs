unit fm_category;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel, base_frame_list,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, uniMultiItem, FireDAC.Stan.Param,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, cad_category,
  uniGUIApplication, uniPanel;

type
  TFmCategory = class(TBaseFrameList)
    procedure sb_registerClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmCategory: TFmCategory;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TFmCategory }

procedure TFmCategory.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' SELECT * ',
              ' FROM tb_category ',
              ' WHERE tb_institution_id =:tb_institution_id ',
              ' ORDER BY posit_level '
            ));
            ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;


procedure TFmCategory.sb_registerClick(Sender: TObject);
var
  Form : TCadCategory;
begin
  if Form = nil then
    Form := TCadCategory.Create(UniApplication);
  if ( DBLCB_Lista.Text <> '') then
    Form.CodigoRegistro := DBLCB_Lista.Keyvalue
  else
    Form.CodigoRegistro := 0;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if form.Category.Registro.Codigo > 0 then
      Begin
        DBLCB_Lista.KeyValue  := form.Category.Registro.Codigo;
        DBLCB_Lista.Text      := form.Category.Registro.Descricao;
      End;
      Form := nil;
    end
  );
end;

procedure TFmCategory.Sb_SearchClick(Sender: TObject);
var
  Form : TCadCategory;
begin
  if Form = nil then
    Form := TCadCategory.Create(UniApplication);
  if ( DBLCB_Lista.Text <> '') then
    Form.CodigoRegistro := DBLCB_Lista.Keyvalue
  else
    Form.CodigoRegistro := 0;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      DBLCB_Lista.KeyValue  := form.Category.Registro.Codigo;
      DBLCB_Lista.Text      := form.Category.Registro.Descricao;
      Form := nil;
    end
  );
end;

end.
