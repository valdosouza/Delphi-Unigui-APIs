unit sea_cest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniPageControl;

type
  TSeaCest = class(TBaseSearch)
    cds_searchcest: TStringField;
    cds_searchdescription: TStringField;
    cds_searchncm: TStringField;
    label1: TUniLabel;
    E_Codigo_ncm: TUniEdit;
    label2: TUniLabel;
    E_Description: TUniEdit;
    UniLabel1: TUniLabel;
    E_codigo_cest: TUniEdit;

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
  SeaCest: TSeaCest;

implementation

{$R *.dfm}

uses MainModule;

{ TBaseSearch1 }

procedure TSeaCest.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by cest.description ';
end;

procedure TSeaCest.SelectSql;
begin
  SelectTxt :=  concat (
                ' SELECT cest.cest , cest.description ,cest.ncm ',
                ' FROM tb_cest cest '
                        )
end;

procedure TSeaCest.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    if E_Codigo_ncm.Text <> '' then
      ParamByName('ncm').AsString := E_Codigo_ncm.Text + '%';

    if E_Codigo_cest.Text <> '' then
      ParamByName('cest').AsString := E_Codigo_cest.Text + '%';

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaCest.WhereSql;
begin
  inherited;
  WhereTxt := ' where cest.cest is not null  ';

  if E_Codigo_ncm.Text <> '' then
    WhereTxt := WhereTxt + ' and (cest.ncm like :ncm)';

  if E_Codigo_cest.Text <> '' then
    WhereTxt := WhereTxt + ' and (cest.cest like :cest)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (ncm.description like :description)';
end;

end.
