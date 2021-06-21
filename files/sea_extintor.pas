unit sea_extintor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniDateTimePicker,
  uniCheckBox, uniPanel, uniEdit, uniLabel, uniGroupBox, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, fm_entity, fm_situation,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaExtintor = class(TBaseSearch)
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    Ctn_Entity: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniEdit2: TUniEdit;
    UniLabel3: TUniLabel;
    UniEdit3: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdit4: TUniEdit;
    UniLabel5: TUniLabel;
    UniEdit5: TUniEdit;
    UniLabel6: TUniLabel;
    UniEdit6: TUniEdit;
    UniLabel7: TUniLabel;
    UniEdit7: TUniEdit;
    Ctn_Situation: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniEdit8: TUniEdit;
    ChBx_Periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    UniCheckBox1: TUniCheckBox;
    UniCheckBox2: TUniCheckBox;
    UniCheckBox3: TUniCheckBox;

    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure FormatScreen;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
    procedure ShowEntity;
    procedure ShowSituation;
  public
    { Public declarations }
    FrEntity : TFmEntity;
    FrSituation : TFmSituation;
  end;

var
  SeaExtintor: TSeaExtintor;

implementation

{$R *.dfm}

uses openForms;

{ TSeaExtintor }

procedure TSeaExtintor.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowSituation;
end;

procedure TSeaExtintor.GetView;
begin
  inherited;
 openCadExtintor(nil);
end;

procedure TSeaExtintor.InnerJoinSql;
begin
  inherited;
  //
end;

procedure TSeaExtintor.OrderBySql;
begin
  inherited;
//
end;

procedure TSeaExtintor.SelectSql;
begin
  inherited;
//
end;

procedure TSeaExtintor.SetParameters;
begin
  inherited;
 //
end;

procedure TSeaExtintor.SetRegister;
begin
 openCadExtintor(nil);
end;

procedure TSeaExtintor.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

procedure TSeaExtintor.ShowSituation;
begin
 FrSituation := TFmSituation.Create(Self);
 FrSituation.Parent := Ctn_Situation;
 FrSituation.Listar;
 FrSituation.Align := alClient;
 FrSituation.Show;
end;

procedure TSeaExtintor.WhereSql;
begin
  inherited;
 //
end;

end.
