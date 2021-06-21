unit base_frame_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TBaseFrameList = class(TFmBaseFrame)
    DSP: TDataSetProvider;
    cds_search: TClientDataSet;
    ds_search: TDataSource;
    Sb_Register: TUniSpeedButton;
    Sb_Search: TUniSpeedButton;
    DBLCB_Lista: TUniDBLookupComboBox;
    pnl_lista: TUniPanel;
    procedure setVariable;Override;
  private
  protected
    procedure InitvaRiable;override;
    procedure setImages;Override;
  public
  end;

var
  BaseFrameList: TBaseFrameList;

implementation

{$R *.dfm}

{ TBaseFrameList }

procedure TBaseFrameList.InitvaRiable;
begin
  inherited;

end;

procedure TBaseFrameList.setImages;
begin
  inherited;
  buttonIcon(sb_search,'miniSearch.bmp');
end;

procedure TBaseFrameList.setVariable;
begin
  inherited;
  cds_search.Close;
end;

end.
