unit sea_order_budget_media;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, uniDateTimePicker, uniGroupBox, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniPageControl;

type
  TSeaOrderBudgetMedia = class(TBaseSearch)
    UniGroupBox1: TUniGroupBox;
    UniDateTimePicker1: TUniDateTimePicker;
    UniDateTimePicker2: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdit2: TUniEdit;
    UniCheckBox1: TUniCheckBox;
    UniCheckBox2: TUniCheckBox;

    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaOrderBudgetMedia: TSeaOrderBudgetMedia;

implementation

{$R *.dfm}

uses openForms;

{ TSeaOrderBudgetMedia }

procedure TSeaOrderBudgetMedia.GetView;
begin
 openTasOrderBudgetMedia(0);
end;

procedure TSeaOrderBudgetMedia.InnerJoinSql;
begin
  inherited;
  //
end;

procedure TSeaOrderBudgetMedia.Sb_SearchClick(Sender: TObject);
begin
  exit   ;
  inherited;
end;

procedure TSeaOrderBudgetMedia.SetParameters;
begin
  inherited;
 //
end;

procedure TSeaOrderBudgetMedia.SetRegister;
begin
  openTasOrderBudgetMedia(0);
end;

procedure TSeaOrderBudgetMedia.WhereSql;
begin
  inherited;
  //
end;

end.
