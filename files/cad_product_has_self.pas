unit cad_product_has_self;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniBasicGrid, uniDBGrid, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, MainModule;

type
  TCadProductHasSelf = class(TBaseRegistry)
    dbg_Search: TUniDBGrid;
    DSP: TDataSetProvider;
    cds_composition: TClientDataSet;
    ds_composition: TDataSource;
  private
    { Private declarations }
    procedure search;
  public
    { Public declarations }
  end;

var
  CadProductHasSelf: TCadProductHasSelf;

implementation

{$R *.dfm}

{ TCadProductHasProduct }

procedure TCadProductHasSelf.search;
begin
  cds_composition.Active := False;
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.clear;
    sql.add(concat(
              'Select pr.id, pr.description, php.quantity ',
              'from tb_product pr ',
              '  inner join tb_product_has_product php ',
              '  on (php.master_id = pr.id) and (php.tb_institution_id = pr.tb_institution_id) ',
              'where ( php.tb_institution_id =:institution_id ) ',
              ' and ( php.master_id =:product_id ) '
    ));
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    ParamByName('product_id').AsInteger := CodigoRegistro;
    Active := True;
  End;
  cds_composition.Active := True;
end;

end.
