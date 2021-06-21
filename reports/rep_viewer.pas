unit rep_viewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniGUIBaseClasses,
  uniURLFrame, uniEdit, uniButton, uniBitBtn, uniSpeedButton, uniPanel  ;

type
  TRepViewer = class(TUniForm)
    LinkPDF: TUniURLFrame;
    UniPanel1: TUniPanel;
    UniSpeedButton1: TUniSpeedButton;
    E_Link: TUniEdit;
    nbttnClose: TUniButton;
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure nbttnCloseClick(Sender: TObject);
  private
  public
    invNum : string;
  end;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

procedure TRepViewer.nbttnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TRepViewer.UniSpeedButton1Click(Sender: TObject);
begin
  LinkPDF.URL := E_Link.Text;
  LinkPDF.Update;
end;

end.
