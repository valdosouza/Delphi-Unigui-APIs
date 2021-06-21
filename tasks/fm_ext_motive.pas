unit fm_ext_motive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmExtMotive = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
  end;

var
  FmExtMotive: TFmExtMotive;

implementation

{$R *.dfm}

uses MainModule, openForms;

procedure TFmExtMotive.Listar;
begin
 with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
               ' Select distinct em.id, em.kind, em.description  ',
               ' from tb_ext_motive em ',
               ' where ( em.id is not null ) ',
               'order by em.description '
            ));
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  TIntegerField(cds_search.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmExtMotive.Sb_RegisterClick(Sender: TObject);
begin
  openCadExtMotive(0,DBLCB_Lista);
end;

procedure TFmExtMotive.Sb_SearchClick(Sender: TObject);
begin
  openSeaExtMotive(DBLCB_Lista );
end;

end.
