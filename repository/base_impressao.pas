unit base_impressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniMultiItem, uniListBox, uniLabel, uniButton,
  uniBitBtn, uniSpeedButton, uniGroupBox, Data.DB, Datasnap.DBClient, Vcl.Menus,
  uniMainMenu;

type
  TBaseImpressao = class(TBaseForm)
    pnl_Botao: TUniPanel;
    pnl_Lista: TUniPanel;
    Lbx_reports: TUniListBox;
    SB_Print: TUniSpeedButton;
    SB_Export: TUniSpeedButton;
    Sb_Close: TUniSpeedButton;
    Parâmetros: TUniGroupBox;
    UniLabel1: TUniLabel;
    procedure setImages;Override;
    procedure Sb_CloseClick(Sender: TObject);
    procedure SB_PrintClick(Sender: TObject);
    procedure SB_ExportClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function validadePrint:Boolean;Virtual;
    procedure setPrint;Virtual;
    function validadeExport:Boolean;Virtual;
    procedure setExport;Virtual;
  public
    { Public declarations }
  end;

var
  BaseImpressao: TBaseImpressao;

implementation

{$R *.dfm}

uses openReports;

{ TBaseImpressao }

procedure TBaseImpressao.Sb_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TBaseImpressao.SB_ExportClick(Sender: TObject);
begin
  if validadeExport then
    setExport;

end;

procedure TBaseImpressao.SB_PrintClick(Sender: TObject);
begin
  if validadePrint then
    setPrint;
end;

procedure TBaseImpressao.setExport;
begin

end;

procedure TBaseImpressao.setImages;
begin
  inherited;
  buttonIcon(Sb_print,'print.bmp');
  buttonIcon(Sb_Export,'export.bmp');
  buttonIcon(Sb_Close,'close.bmp');
end;

procedure TBaseImpressao.setPrint;
begin

end;

function TBaseImpressao.validadeExport: Boolean;
begin
  Result := True;
end;

function TBaseImpressao.validadePrint: Boolean;
begin
  Result := True;
end;

end.
