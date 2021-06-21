unit tas_order_budget_media;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniCheckBox, uniGroupBox, uniRadioGroup, uniDateTimePicker,
  uniLabel, uniEdit, uniMemo, uniBasicGrid, uniDBGrid, uniPageControl, fm_agency, fm_customer;

type
  TTasOrderBudgetMedia = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniDateTimePicker2: TUniDateTimePicker;
    UniRadioGroup1: TUniRadioGroup;
    UniGroupBox1: TUniGroupBox;
    UniCheckBox1: TUniCheckBox;
    UniDateTimePicker3: TUniDateTimePicker;
    Ctn_Agency: TUniContainerPanel;
    Ctn_Customer: TUniContainerPanel;
    UniEdit2: TUniEdit;
    UniEdit3: TUniEdit;
    UniEdit4: TUniEdit;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    UniSpeedButton4: TUniSpeedButton;
    M_Obs: TUniMemo;
    UniLabel7: TUniLabel;
    UniEdit5: TUniEdit;
    UniLabel8: TUniLabel;
    UniEdit6: TUniEdit;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniEdit7: TUniEdit;
    UniGroupBox2: TUniGroupBox;
    UniLabel11: TUniLabel;
    UniEdit8: TUniEdit;
    UniCheckBox2: TUniCheckBox;
    procedure InitVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure Delete;Override;
    procedure setVariable; override;
  private
    { Private declarations }
    procedure ShowAgency;
    procedure ShowCustomer;
  public
    { Public declarations }
    FrAgency : TFmAgency;
    FrCustomer : TFmCustomer;
  end;

var
  TasOrderBudgetMedia: TTasOrderBudgetMedia;

implementation

{$R *.dfm}

{ TTasOrderBudgetMedia }

procedure TTasOrderBudgetMedia.ClearAllFields;
begin
  inherited;
  ClearFields(FrAgency);
  ClearFields(FrCustomer);
end;

procedure TTasOrderBudgetMedia.Delete;
begin
  inherited;
 //
end;

procedure TTasOrderBudgetMedia.EditionControl;
begin
  inherited;
  EditionControler(FrAgency);
  EditionControler(FrCustomer);
end;

procedure TTasOrderBudgetMedia.FormatScreen;
begin
  inherited;
  ShowAgency;
  ShowCustomer;
end;

procedure TTasOrderBudgetMedia.InitVariable;
begin
  inherited;
 //
end;

procedure TTasOrderBudgetMedia.Insert;
begin
 inherited;
 ClearAllFields;
end;

procedure TTasOrderBudgetMedia.Save;
begin
  inherited;
  //
end;

procedure TTasOrderBudgetMedia.setImages;
begin
  inherited;
 //
end;

procedure TTasOrderBudgetMedia.setVariable;
begin
  inherited;
 //
end;

procedure TTasOrderBudgetMedia.ShowAgency;
begin
  FrAgency := TfmAgency.Create(Self);
  FrAgency.Parent := Ctn_Agency;
  FrAgency.Align := alClient;
  FrAgency.Listar;
  FrAgency.Show;
end;

procedure TTasOrderBudgetMedia.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Self);
  FrCustomer.Parent := Ctn_Customer;
  FrCustomer.Align := alClient;
  FrCustomer.Listar;
  FrCustomer.Show;
end;

procedure TTasOrderBudgetMedia.ShowData;
begin
  inherited;
  //
end;

procedure TTasOrderBudgetMedia.ShowNoData;
begin
  inherited;
  //
end;

function TTasOrderBudgetMedia.ValidaInsert: boolean;
begin
 Result := True;
end;

function TTasOrderBudgetMedia.ValidateSave: boolean;
begin
  Result := True;
end;

end.
