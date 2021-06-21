unit sea_observation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniLabel, uniEdit,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel, ControllerObservation, UniDBLookupComboBox, uniPageControl,
  Vcl.Menus, uniMainMenu;

type
  TSeaObservation = class(TBaseSearch)
    cds_searchdescription: TStringField;
    cds_searchid: TIntegerField;
    E_Description: TUniEdit;
    L_NameCompany: TUniLabel;
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
    Observation: TControllerObservation;
  end;

var
  SeaObservation: TSeaObservation;

implementation

uses MainModule, openForms;

{$R *.dfm}

{ TSeaObservation }

{ TSeaObservation }

procedure TSeaObservation.GetView;
begin
  openCadObservation(cds_searchid.AsInteger,nil);
end;

procedure TSeaObservation.InnerJoinSql;
begin
  InnerJoinTxt := concat(InnerJoinTxt,
                  '  inner join tb_institution ins ',
                  '  on (obs.tb_institution_id = ins.id) '
                  );
end;

procedure TSeaObservation.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by obs.description ';
end;

procedure TSeaObservation.SelectSql;
begin
  SelectTxt := ' Select obs.id, obs.description '+
               ' from tb_observation obs ';
end;

procedure TSeaObservation.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

  end;
end;

procedure TSeaObservation.SetRegister;
begin
  openCadObservation(0,nil);
end;

procedure TSeaObservation.WhereSql;
begin
  inherited;
  WhereTxt := ' where obs.tb_institution_id =:tb_institution_id ';

  if E_Description.Text <> '' then
    WhereTxt := concat(WhereTxt,
                        ' and (obs.description like :description) ' );
end;


end.
