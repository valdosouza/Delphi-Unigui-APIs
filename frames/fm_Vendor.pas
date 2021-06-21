unit fm_Vendor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniEdit, uniGUIBaseClasses, uniLabel;

type
  TFmVendor = class(TFmBaseFrame)
    Lb_Descricao: TUniLabel;
    E_Description: TUniEdit;
    sb_register: TUniSpeedButton;
    sb_search: TUniSpeedButton;
    procedure setImages;Override;
    procedure sb_registerClick(Sender: TObject);
    procedure sb_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmVendor: TFmVendor;

implementation

{$R *.dfm}

uses openForms;

procedure TFmVendor.sb_registerClick(Sender: TObject);
begin
  openCadCarrier(E_Description);
end;

procedure TFmVendor.sb_searchClick(Sender: TObject);
Var
  sqltxt : String;
begin
  sqltxt := 'Select e.id, e.name_company '+
            'from tb_vendor v '+
            '  inner join tb_entity e '+
            '  on (e.id = v.id) ';
  openPesqGeneralList(E_Description,sqltxt,'id','name_company','name_company',13);
end;

procedure TFmVendor.setImages;
begin
  inherited;
  buttonIcon(sb_search,'miniSearch.bmp');
end;

end.
