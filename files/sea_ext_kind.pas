unit sea_ext_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniLabel, uniEdit,
  uniGroupBox, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniPanel, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaExtKind = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchclass: TStringField;
    cds_searchcapacity: TBCDField;
    E_Description: TUniEdit;
    UniLabel1: TUniLabel;
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
  SeaExtKind: TSeaExtKind;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaExtKind }

procedure TSeaExtKind.GetView;
begin
 openCadExtKind(cds_searchid.AsInteger,nil);
end;

procedure TSeaExtKind.InnerJoinSql;
begin
 InnerJoinTxt := concat(
                   ' inner join tb_ext_agent ea '+
                   ' on (ea.id = ek.tb_ext_agent_id) '
                  );
end;
procedure TSeaExtKind.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ea.description ';
end;

procedure TSeaExtKind.SelectSql;
begin
  SelectTxt := ' Select distinct ek.id, ea.description, ea.class, ek.capacity '+
               ' from tb_ext_kind ek ';
end;

procedure TSeaExtKind.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaExtKind.SetRegister;
begin
  openCadExtKind(0,nil);
end;

procedure TSeaExtKind.WhereSql;
begin
  inherited;
  WhereTxt := ' where ek.tb_institution_id =:tb_institution_id ';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (ea.description like :description)';
end;

end.
