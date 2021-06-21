unit sea_med_pos_prog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,UniEdit,UniLabel, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaMedPosProg = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    label1: TUniLabel;
    E_Codigo: TUniEdit;
    E_Description: TUniEdit;
    label2: TUniLabel;
   procedure SelectSql;Override;
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
  SeaMedPosProg: TSeaMedPosProg;

implementation

{$R *.dfm}

uses MainModule,openForms;

{ TSeaMedPosProg }

procedure TSeaMedPosProg.GetView;
begin
  openCadMedPosProg(cds_searchid.AsInteger,nil);
end;

procedure TSeaMedPosProg.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by mp.description ';
end;


procedure TSeaMedPosProg.SelectSql;
begin
  SelectTxt := ' Select distinct mp.id, mp.description'+
               ' from tb_med_pos_prog mp ';
end;

procedure TSeaMedPosProg.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

  end;
end;

procedure TSeaMedPosProg.SetRegister;
begin
  openCadMedPosProg(0,nil);
end;

procedure TSeaMedPosProg.WhereSql;
begin
  inherited;
  WhereTxt := ' where mp.tb_institution_id =:tb_institution_id ';


  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (mp.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (mp.description like :description)';

end;

end.
