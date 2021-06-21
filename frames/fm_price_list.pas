unit fm_price_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmPriceList = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmPriceList: TFmPriceList;

implementation

{$R *.dfm}

uses MainModule, openForms;

procedure TFmPriceList.listar;
begin
   with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               ' Select distinct pl.id, pl.description'+
               ' from tb_price_list pl ',
               ' WHERE (pl.tb_institution_id =:tb_institution_id ) ',
               ' order by pl.description  '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmPriceList.Sb_RegisterClick(Sender: TObject);
begin
  openCadPriceList(0,DBLCB_Lista );
end;

procedure TFmPriceList.Sb_SearchClick(Sender: TObject);
begin
  openSeaPriceList(DBLCB_Lista );
end;

end.
