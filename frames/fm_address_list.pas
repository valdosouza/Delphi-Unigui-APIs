unit fm_address_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel, uniPanel;

type
  TFmAddressList = class(TBaseFrameList)
    procedure Sb_RegisterClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listar;
  end;

var
  FmAddressList: TFmAddressList;

implementation

{$R *.dfm}

uses MainModule;

{ TFmAddressList }

procedure TFmAddressList.listar;
begin
 //
end;

procedure TFmAddressList.Sb_RegisterClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFmAddressList.Sb_SearchClick(Sender: TObject);
begin
  inherited;
  //
end;

end.
