unit sea_cfop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniRadioGroup, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,FireDAC.Stan.Param,
  uniPanel, UniDBLookupComboBox, uniPageControl;

type
  TSeaCfop = class(TBaseSearch)
    cds_searchid: TStringField;
    cds_searchdescription: TStringField;
    E_Register: TUniEdit;
    Rg_way: TUniRadioGroup;
    UniLabel3: TUniLabel;
    E_Description: TUniEdit;
    Rg_Juristiction: TUniRadioGroup;
    Rg_Enabled: TUniRadioGroup;
    c: TUniLabel;
    UniLabel1: TUniLabel;
    E_Cfop: TUniEdit;
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
  SeaCfop: TSeaCfop;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaCfop }

procedure TSeaCfop.GetView;
begin
  openCadCfop(cds_searchid.AsInteger,nil);
end;

procedure TSeaCfop.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by cf.description ';
end;

procedure TSeaCfop.SelectSql;
begin
  SelectTxt := concat (
                    ' Select distinct cf.id, cf.description, cf.jurisdiction ',
                    ' from tb_cfop cf '
               );
end;

procedure TSeaCfop.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_Cfop.Text <> '' then
      ParamByName('id').AsString := E_Cfop.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if E_Register.Text <> '' then
      ParamByName('register').AsString := '%' + E_Register.Text + '%' ;

    if Rg_way.ItemIndex  = 0  then
      ParamByName('way').AsString := 'E'
    else
      ParamByName('way').AsString := 'S';

    if Rg_Enabled.ItemIndex = 0 then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';

    case Rg_Juristiction.ItemIndex of
      0:ParamByName('jurisdiction').AsString := 'E';
      1:ParamByName('jurisdiction').AsString := 'N';
      2:ParamByName('jurisdiction').AsString := 'X';
    end;


  End;
end;

procedure TSeaCfop.SetRegister;
begin
  openCadCfop(0,nil);
end;

procedure TSeaCfop.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';


  if E_Cfop.Text <> '' then
    WhereTxt := WhereTxt + ' and (cf.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (cf.description like :description)';

  if E_Register.Text <> '' then
    WhereTxt := WhereTxt + ' and (cf.register like :register )';

    WhereTxt := WhereTxt + ' and (cf.way =:way )';

    WhereTxt := WhereTxt + ' and (cf.active =:active )';

    whereTxT := WhereTxt + ' and (cf.jurisdiction =:jurisdiction)';

end;

end.
