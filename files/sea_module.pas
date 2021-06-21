unit sea_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniLabel, uniEdit,
  uniImage, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaModule = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    L_Codigo: TUniLabel;
    E_ID_Search: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    procedure formatscreen;override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
    procedure returnRegister;Override;
    procedure Sb_CloseClick(Sender: TObject);
    procedure img_maximizeClick(Sender: TObject);
    procedure img_minimizeClick(Sender: TObject);
    procedure img_restoreClick(Sender: TObject);
  private
    { Private declarations }
    TopOld : Integer;
    LeftOld : Integer;
    HeightOld : Integer;
    widthOld : Integer;
  public
    { Public declarations }
  end;

var
  SeaModule: TSeaModule;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaModule }

procedure TSeaModule.formatscreen;
begin
  inherited;
//  buttonIcon(sb_minimize,'minimize.bmp');
//  buttonIcon(sb_restore,'restore.bmp');
//  buttonIcon(sb_maximize,'maximize.bmp');

//  if TopOld = 0 then TopOld := Self.top;
//  if LeftOld = 0 then LeftOld := Self.Left;
//  if HeightOld = 0 then HeightOld := Self.Height;
//  if WidthOld = 0 then WidthOld := Self.Width;
  TopOld := Self.top;
  LeftOld := Self.Left;
  HeightOld := Self.Height;
  WidthOld := Self.Width;

end;

procedure TSeaModule.GetView;
  Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadModule(lcodigo);
end;

procedure TSeaModule.InnerJoinSql;
begin
//
end;

procedure TSeaModule.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by m.id ';
end;

procedure TSeaModule.returnRegister;
begin
  CodigoRegistro := cds_searchid.AsInteger;
  DescricaoRegistro := cds_searchdescription.AsString;
end;

procedure TSeaModule.Sb_CloseClick(Sender: TObject);
begin
  returnRegister;
  inherited;
end;

procedure TSeaModule.SelectSql;
begin
  SelectTxt := ' Select distinct m.id, m.description '+
               ' from tb_Module m ';
end;

procedure TSeaModule.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

  end;
end;

procedure TSeaModule.SetRegister;
begin
  openCadModule(nil);
end;

procedure TSeaModule.img_maximizeClick(Sender: TObject);
begin
  UniSession.AddJS(Self.WebForm.JSName + '.maximize();');
end;

procedure TSeaModule.img_restoreClick(Sender: TObject);
begin
  Self.top := TopOld;
  Self.Left := LeftOld;
  Self.Height := HeightOld ;
  self.ClientHeight := HeightOld ;
  Self.Width := WidthOld;
  UniSession.AddJS(Self.WebForm.JSName + '.restore();');
end;

procedure TSeaModule.img_minimizeClick(Sender: TObject);
begin
  Self.Left := 0;
	Self.Top:= Screen.Height;
  self.ClientHeight := 0;
  //self.LayoutAttribs.Height := '0';
  Self.Height := 0;
  Self.Width := 100;
end;

procedure TSeaModule.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (m.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (m.description like :description)';


end;

end.
