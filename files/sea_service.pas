unit sea_service;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaService = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    label1: TUniLabel;
    E_Codigo: TUniEdit;
    label2: TUniLabel;
    E_Description: TUniEdit;

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
  SeaService: TSeaService;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaService }

procedure TSeaService.GetView;
Var
  lcodigo : TUniEdit;
begin
  lcodigo := TUniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadService(lcodigo);
end;

procedure TSeaService.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  ' INNER JOIN tb_product pro ',
                  ' ON pro.id = ser.id ',
                  ' and pro.tb_institution_id = ser.tb_institution_id '
                  );
end;

procedure TSeaService.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by pro.description '
end;

procedure TSeaService.SelectSql;
begin
  SelectTxt := concat(
                ' SELECT ser.id , pro.description ',
                ' FROM tb_service ser '
                );
end;

procedure TSeaService.SetParameters;
begin
with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%';


  End;
end;

procedure TSeaService.SetRegister;
begin
  inherited;
  openCadService(nil);
end;

procedure TSeaService.WhereSql;
begin
  inherited;
  WhereTxt := ' where ser.tb_institution_id =:tb_institution_id ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (ser.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (pro.description like :description)';
end;

end.
