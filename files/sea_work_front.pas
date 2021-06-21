unit sea_work_front;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl,
  uniGUIBaseClasses, uniPanel, MainModule, Vcl.Menus, uniMainMenu;

type
  TSeaWorkFront = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    label1: TUniLabel;
    label2: TUniLabel;
    E_Codigo: TUniEdit;
    E_Description: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;
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
  SeaWorkFront: TSeaWorkFront;

implementation

{$R *.dfm}

uses openForms;

{ TSeaWorkFront }

procedure TSeaWorkFront.GetView;
begin
  inherited;
  openCadWorkFront(cds_searchid.AsInteger,nil);
end;

procedure TSeaWorkFront.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by w.description ';
end;

procedure TSeaWorkFront.SelectSql;
begin
  inherited;
  SelectTxt := ' Select distinct w.id, w.description '+
               ' from tb_work_front w ';

end;

procedure TSeaWorkFront.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if chbx_cadAtivo.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';
  end;


end;

procedure TSeaWorkFront.SetRegister;
begin
  openCadWorkFront(0,nil);
end;

procedure TSeaWorkFront.WhereSql;
begin
  inherited;
  WhereTxt := ' where w.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (w.active =:active) ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (w.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (w.description like :description)';

end;

end.
