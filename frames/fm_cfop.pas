unit fm_cfop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniMultiItem, uniComboBox, uniGUIBaseClasses, uniGUIClasses,
  uniCheckBox, uniEdit, base_frame_list, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, uniDBComboBox, uniDBLookupComboBox, uniLabel, uniPanel;


type
  TFmCFOP = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listar;
    procedure Filtrar(way,jurisdiction:String);
  end;

var
  FmCFOP: TFmCFOP;

implementation

{$R *.dfm}

uses openForms, MainModule;


{ TFmCFOP }

procedure TFmCFOP.Filtrar(way,jurisdiction:String);
Var
  LcFilter : String;
begin
  cds_search.Filtered := False;
  if way = 'E' then
    LcFilter := concat(' (way = ''E'') ')
  else
    LcFilter := concat(' (way = ''S'') ');

  if (jurisdiction = 'E') then
    LcFilter := concat(LcFilter,' and (jurisdiction =''E'')')
  else
    LcFilter := concat(LcFilter,' and (jurisdiction =''N'')');

  cds_search.Filter := LcFilter;
  cds_search.Filtered := True;
end;

procedure TFmCFOP.Listar;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct cf.id, cf.description, cf.jurisdiction,cf.way ',
              ' from tb_cfop cf ',
              ' WHERE (cf.active = ''S'') ',
              ' order by cf.description '
            ));
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
end;

procedure TFmCFOP.Sb_RegisterClick(Sender: TObject);
begin
  openCadCfop(0,DBLCB_Lista);
end;

procedure TFmCFOP.Sb_SearchClick(Sender: TObject);
begin
  openSeaCfop(DBLCB_Lista);
end;

end.
