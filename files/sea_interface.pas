unit sea_interface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniPageControl, Vcl.Menus, uniMainMenu, uniCheckBox;

type
  TSeaInterface = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchkind: TStringField;
    L_Codigo: TUniLabel;
    E_ID_Search: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    L_Kind: TUniLabel;
    E_Kind: TUniEdit;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaInterface: TSeaInterface;

implementation

{$R *.dfm}
uses MainModule, openForms;

{ TSeaInterface }

procedure TSeaInterface.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadInterface(lcodigo);
end;

procedure TSeaInterface.InnerJoinSql;
begin
//
end;

procedure TSeaInterface.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ifc.id ';
end;

procedure TSeaInterface.SelectSql;
begin
  SelectTxt := ' Select distinct ifc.id, ifc.description, ifc.kind '+
               ' from tb_interface ifc ';
end;

procedure TSeaInterface.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
    if E_Kind.Text <> '' then
      ParamByName('kind').AsString := '%' + E_Kind.Text + '%';
  end;
end;

procedure TSeaInterface.SetRegister;
begin
  openCadInterface(nil);
end;

procedure TSeaInterface.WhereSql;
begin
  inherited;
  WhereTxt := ' where ifc.id is not null ';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (ifc.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (ifc.description like :description)';

  if E_Kind.Text <> '' then
    WhereTxt := WhereTxt + 'and (ifc.kind like :kind)';
end;
end.
