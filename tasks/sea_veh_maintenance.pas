unit sea_veh_maintenance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniPageControl, uniGUIBaseClasses, uniPanel, uniEdit,
  uniLabel, uniDateTimePicker, uniCheckBox, uniGroupBox, uniMemo, fm_Entity,
  Vcl.Menus, uniMainMenu;

type
  TSeaVehMaintenance = class(TBaseSearch)
    tbs_parts: TUniTabSheet;
    tbs_services: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    cds_peças: TClientDataSet;
    ds_peças: TDataSource;
    cds_service: TClientDataSet;
    ds_service: TDataSource;
    ds_note: TDataSource;
    cds_note: TClientDataSet;
    UniPanel1: TUniPanel;
    UniSpeedButton1: TUniSpeedButton;
    tbs_notes: TUniTabSheet;
    UniDBGrid3: TUniDBGrid;
    UniPanel3: TUniPanel;
    UniLabel33: TUniLabel;
    E_ref: TUniEdit;
    M_note: TUniMemo;
    UniLabel34: TUniLabel;
    UniPanel4: TUniPanel;
    UniSpeedButton4: TUniSpeedButton;
    UniSpeedButton5: TUniSpeedButton;
    UniSpeedButton6: TUniSpeedButton;
    UniSpeedButton7: TUniSpeedButton;
    UniSpeedButton8: TUniSpeedButton;
    tbs_data_vehicle: TUniTabSheet;
    UniLabel4: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel5: TUniLabel;
    E_prisma_: TUniEdit;
    UniLabel6: TUniLabel;
    E_hora: TUniEdit;
    UniLabel20: TUniLabel;
    E_order_: TUniEdit;
    UniLabel14: TUniLabel;
    E_placa_: TUniEdit;
    UniLabel15: TUniLabel;
    E_frota: TUniEdit;
    UniLabel16: TUniLabel;
    E_km: TUniEdit;
    UniLabel17: TUniLabel;
    E_ano: TUniEdit;
    UniLabel18: TUniLabel;
    E_cilindrada: TUniEdit;
    UniLabel19: TUniLabel;
    E_marca: TUniEdit;
    UniLabel21: TUniLabel;
    E_modelo: TUniEdit;
    E_tipo: TUniEdit;
    UniLabel23: TUniLabel;
    E_cor: TUniEdit;
    M_memo: TUniMemo;
    UniLabel24: TUniLabel;
    UniDateTimePicker3: TUniDateTimePicker;
    UniDateTimePicker4: TUniDateTimePicker;
    UniGroupBox1: TUniGroupBox;
    UniLabel25: TUniLabel;
    E_customer: TUniEdit;
    E_contact: TUniEdit;
    UniLabel26: TUniLabel;
    UniLabel27: TUniLabel;
    E_mail: TUniEdit;
    UniLabel28: TUniLabel;
    E_fone: TUniEdit;
    UniLabel29: TUniLabel;
    E_fax: TUniEdit;
    UniLabel30: TUniLabel;
    E_cel: TUniEdit;
    UniLabel31: TUniLabel;
    E_comercial: TUniEdit;
    UniLabel32: TUniLabel;
    UniEdit28: TUniEdit;
    UniDBGrid2: TUniDBGrid;
    UniPanel2: TUniPanel;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    UniSpeedButton9: TUniSpeedButton;
    UniSpeedButton10: TUniSpeedButton;
    ChBx_Periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    E_order: TUniEdit;
    UniLabel2: TUniLabel;
    E_placa: TUniEdit;
    UniLabel3: TUniLabel;
    E_prisma: TUniEdit;
    Ctn_Entity: TUniContainerPanel;
    procedure FormatScreen;Override;

    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

    procedure ShowEntity;
  private
    { Private declarations }
  public
    { Public declarations }
    FrEntity               : TFmEntity;
  end;

var
  SeaVehMaintenance: TSeaVehMaintenance;

implementation

{$R *.dfm}

{ TSeaVehMaintenance }

procedure TSeaVehMaintenance.FormatScreen;
begin
  inherited;
  ShowEntity;
end;

procedure TSeaVehMaintenance.GetView;
begin
  inherited;
//
end;

procedure TSeaVehMaintenance.InnerJoinSql;
begin
  inherited;
//
end;

procedure TSeaVehMaintenance.OrderBySql;
begin
  inherited;
//
end;

procedure TSeaVehMaintenance.SelectSql;
begin
  inherited;
//
end;

procedure TSeaVehMaintenance.SetParameters;
begin
  inherited;
//
end;

procedure TSeaVehMaintenance.SetRegister;
begin
  inherited;
//
end;

procedure TSeaVehMaintenance.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.listar;
  FrEntity.Align := alClient;
  FrEntity.Show;
end;

procedure TSeaVehMaintenance.WhereSql;
begin
  inherited;
//
end;

end.
