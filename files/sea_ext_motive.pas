unit sea_ext_motive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniMultiItem,
  uniComboBox, uniLabel, uniGroupBox, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniPageControl;

type
  TSeaExtMotive = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchkind: TStringField;
    cds_searchdescription: TStringField;
    UniLabel1: TUniLabel;
    Cb_Kind: TUniComboBox;
    E_Description: TUniEdit;
    UniLabel2: TUniLabel;

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
  SeaExtMotive: TSeaExtMotive;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaExtMotivos }

procedure TSeaExtMotive.GetView;
begin
  openCadExtMotive (cds_searchid.AsInteger,nil);
end;

procedure TSeaExtMotive.InnerJoinSql;
begin
  inherited;
 //
end;

procedure TSeaExtMotive.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by em.description ';
end;

procedure TSeaExtMotive.SelectSql;
begin
  SelectTxt := concat(
               ' Select distinct em.id, em.kind, em.description  ',
               ' from tb_ext_motive em '
               );
end;

procedure TSeaExtMotive.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_description.Text + '%' ;

    if Cb_Kind.ItemIndex  = 0  then
      ParamByName('kind').AsString := 'C'
    else
      ParamByName('kind').AsString := 'R';
  End;
end;

procedure TSeaExtMotive.SetRegister;
begin
  openCadExtMotive(0,nil);
end;

procedure TSeaExtMotive.WhereSql;
begin
  inherited;
  WhereTxt :=  ' where ( em.id is not null ) ';

  if E_Description.Text <> ''  then
    WhereTxt := WhereTxt + ' and (em.description like :description)';

  WhereTxt := WhereTxt + ' and (em.kind =:kind)';
end;

end.
