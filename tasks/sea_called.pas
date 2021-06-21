unit sea_called;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl,
  uniGUIBaseClasses, uniPanel, base_search;

type
  TSeaCalled = class(TFmBaseFrame)
    Dbg_search: TUniDBGrid;
    pnl_botao: TUniPanel;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniButton3: TUniButton;
    UniButton4: TUniButton;
    UniButton5: TUniButton;
    DSP: TDataSetProvider;
    cds_search: TClientDataSet;
    ds_search: TDataSource;
  private
    procedure SetParameters;
    procedure WhereSql;
    { Private declarations }
  protected
    procedure search;
  public
    { Public declarations }
    CodigoRegistro : Integer;
  end;

var
  SeaCalled: TSeaCalled;

implementation

{$R *.dfm}

uses MainModule;

{ TBaseSearch1 }



procedure TSeaCalled.search;
begin
  with Qr_Search do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
        'select i.id, i.tb_order_id, i.updated_at, i.description comentario, s.description situacao ',
        'from tb_iteration i ',
        '  inner join tb_situation s ',
        '  on (i.tb_situation_id = s.id ) ',
        '    and (i.tb_institution_id = s.tb_institution_id ) ',
        '  inner join tb_order o ',
        '  on (o.id = i.tb_order_id) ',
        '    and (o.tb_institution_id = i.tb_institution_id ) ',
        'where i.tb_institution_id =:tb_institution_id ',
        'and i.tb_order_id =:tb_order_id ',
        'order by i.updated_at desc '
    ));
    ParamByName('tb_institution_id').AsInteger := GInstitution.Registro.Codigo;
    ParamByName('tb_order_id').AsInteger := CodigoRegistro;
    Active := True
end;

procedure TSeaCalled.SetParameters;
begin

end;


end.
