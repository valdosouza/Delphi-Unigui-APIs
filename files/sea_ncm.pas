unit sea_ncm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniPageControl;

type
  TSeaNcm = class(TBaseSearch)
    cds_searchnumber: TStringField;
    cds_searchdescription: TStringField;
    cds_searchaliq_nac: TBCDField;
    cds_searchaliq_imp: TBCDField;
    cds_searchaliq_est: TBCDField;
    cds_searchaliq_mun: TBCDField;
    label1: TUniLabel;
    E_Codigo: TUniEdit;
    label2: TUniLabel;
    E_Description: TUniEdit;

    procedure SelectSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaNcm: TSeaNcm;

implementation

{$R *.dfm}

uses MainModule;

{ TSeaNcm }

procedure TSeaNcm.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ncm.description ';
end;

procedure TSeaNcm.SelectSql;
begin
  SelectTxt :=  concat (
                'SELECT ncm.number , ncm.description ,ncm.aliq_nac, ',
                ' ncm.aliq_imp  ,ncm.aliq_est ,ncm.aliq_mun ',
                ' FROM tb_ncm ncm '
                        )
end;

procedure TSeaNcm.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    if E_Codigo.Text <> '' then
      ParamByName('number').AsString := E_Codigo.Text + '%';

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaNcm.WhereSql;
begin
  inherited;
  WhereTxt := ' where ncm.number is not null  ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (ncm.number like :number)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (ncm.description like :description)';
end;

end.
