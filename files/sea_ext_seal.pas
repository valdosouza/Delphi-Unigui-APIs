unit sea_ext_seal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniDateTimePicker,
  uniCheckBox, uniLabel, uniGroupBox, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniPageControl,
  Vcl.Menus, uniMainMenu;

type
  TSeaExtSeal = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchnr_last_used: TStringField;
    UniLabel2: TUniLabel;
    E_nr_last_used: TUniEdit;
    UniDateTimePicker1: TUniDateTimePicker;
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
  SeaExtSeal: TSeaExtSeal;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaExtSeal }

procedure TSeaExtSeal.GetView;
begin
  openCadExtSeal(cds_searchid.AsInteger,nil);
end;

procedure TSeaExtSeal.InnerJoinSql;
begin
  inherited;
  //
end;

procedure TSeaExtSeal.OrderBySql;
begin
  inherited;
  //
end;

procedure TSeaExtSeal.SelectSql;
begin
  SelectTxt := ' Select distinct es.id, es.dt_record, es.nr_last_used '+
               ' from tb_ext_seal es ';
end;

procedure TSeaExtSeal.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_nr_last_used.Text <> '' then
      ParamByName('nr_last_used').AsString := E_nr_last_used.Text ;
  end;
end;

procedure TSeaExtSeal.SetRegister;
begin
 openCadExtSeal(0,nil);
end;

procedure TSeaExtSeal.WhereSql;
begin
  inherited;
  WhereTxt := ' where es.tb_institution_id =:tb_institution_id ';

  if E_nr_last_used.Text <> '' then
    WhereTxt := WhereTxt + ' and (es.nr_last_used =:nr_last_used)';
end;

end.
