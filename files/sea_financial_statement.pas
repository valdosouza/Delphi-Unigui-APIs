unit sea_financial_statement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniRadioGroup, uniEdit,
  uniLabel, uniDateTimePicker, uniCheckBox, uniGroupBox, fm_entity,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaFinancialStatement = class(TBaseSearch)
    UniPanel1: TUniPanel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    UniLabel23: TUniLabel;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    UniLabel28: TUniLabel;
    UniLabel29: TUniLabel;
    ChBx_Periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    Ctn_Entity: TUniContainerPanel;
    UniRadioGroup1: TUniRadioGroup;
    UniRadioGroup2: TUniRadioGroup;
    procedure FormatScreen;Override;
  private
    { Private declarations }
    procedure ShowEntity;
  public
    { Public declarations }
    FrEntity : TFmEntity;
  end;

var
  SeaFinancialStatement: TSeaFinancialStatement;

implementation

{$R *.dfm}

{ TSeaFinancialStatement }

procedure TSeaFinancialStatement.FormatScreen;
begin
  inherited;
  ShowEntity
end;

procedure TSeaFinancialStatement.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

end.
