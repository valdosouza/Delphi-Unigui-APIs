unit sea_ext_agent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniLabel,
  uniGroupBox, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniPanel, uniCheckBox, uniPageControl, Vcl.Menus,
  uniMainMenu;

type
  TSeaExtAgent = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchclass: TStringField;
    chbx_cadAtivo: TUniCheckBox;
    UniLabel1: TUniLabel;
    E_Description: TUniEdit;
    UniLabel2: TUniLabel;
    E_Class: TUniEdit;
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
  SeaExtAgent: TSeaExtAgent;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaExtAgent }

procedure TSeaExtAgent.GetView;
begin
  openCadExtAgent(cds_searchid.AsInteger,nil);
end;

procedure TSeaExtAgent.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_ext_agent i '+
                  '  on (ea.id = i.tb_ext_agent_id)  ';
end;

procedure TSeaExtAgent.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ea.description ';
end;

procedure TSeaExtAgent.SelectSql;
begin
  SelectTxt := ' Select distinct ea.id, ea.description, ea.class '+
               ' from tb_ext_agent ea ';
end;

procedure TSeaExtAgent.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if E_Class.Text <> '' then
      ParamByName('class').AsString := '%' + E_Class.Text + '%' ;

    if chbx_cadAtivo.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';
  end;
end;

procedure TSeaExtAgent.SetRegister;
begin
  openCadExtAgent(0,nil);
end;

procedure TSeaExtAgent.WhereSql;
begin
  inherited;
  WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (ea.description like :description)';

  if E_Class.Text <> '' then
    WhereTxt := WhereTxt + ' and (ea.class like :class)';
end;

end.
