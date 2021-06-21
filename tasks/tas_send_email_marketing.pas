unit tas_send_email_marketing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniMemo, uniHTMLMemo,
  uniEdit, uniButton, uniBasicGrid, uniDBGrid, uniLabel, uniGUIClasses,
  uniSpinEdit, uniPageControl, uniGUIBaseClasses, uniPanel, uniBitBtn,
  uniSpeedButton;

type
  TTasSendEmailMarketing = class(TBaseForm)
    UniPanel2: TUniPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniPanel3: TUniPanel;
    UniSpinEdit1: TUniSpinEdit;
    UniLabel1: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    UniPanel4: TUniPanel;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    UniTabSheet2: TUniTabSheet;
    UniPanel5: TUniPanel;
    UniPanel6: TUniPanel;
    UniLabel2: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel3: TUniLabel;
    UniHTMLMemo1: TUniHTMLMemo;
    UniPanel1: TUniPanel;
    UniButton3: TUniButton;
    UniButton4: TUniButton;
    Sb_Search: TUniSpeedButton;
    Sb_Close: TUniSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasSendEmailMarketing: TTasSendEmailMarketing;

implementation

{$R *.dfm}

end.
