unit tas_order_budget_item_pi_jr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniMultiItem, uniComboBox, uniEdit, uniLabel, uniGroupBox,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, fm_broadcaster, fm_med_pos_prog;


type
  TTasOrderBudgetItemPiJr = class(TBaseRegistry)
    Ctn_Brodcaster: TUniContainerPanel;
    Ctn_Med_Pos_Prog: TUniContainerPanel;
    UniLabel11: TUniLabel;
    E_impress: TUniEdit;
    UniLabel5: TUniLabel;
    Cb_Color: TUniComboBox;
    UniLabel6: TUniLabel;
    Cb_Day: TUniComboBox;
    l_table_value: TUniLabel;
    E_table_value: TUniEdit;
    UniLabel8: TUniLabel;
    E_Negotiaded: TUniEdit;
    UniLabel15: TUniLabel;
    E_nr_column: TUniEdit;
    UniLabel16: TUniLabel;
    E_nr_height: TUniEdit;
    UniLabel14: TUniLabel;
    E_unit_value: TUniEdit;
    UniLabel18: TUniLabel;
    E_insertion: TUniEdit;
    UniGroupBox2: TUniGroupBox;
    UniLabel2: TUniLabel;
    E_table_brut: TUniEdit;
    E_Util_neg: TUniEdit;
    UniLabel7: TUniLabel;
    UniLabel3: TUniLabel;
    E_vl_total: TUniEdit;
    UniLabel1: TUniLabel;
    E_aliq_desc: TUniEdit;

    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    procedure setVariable; override;

    procedure ShowData;Override;
    procedure ShowDataOrder;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Virtual;
    procedure SB_SaveClick(Sender: TObject);

  private
    { Private declarations }
    function getNext :Integer;
  public
    cds_Items     : TClientDataSet;
    FrMedPosProg  : TFmMedPosProg;
    FrBroadcaster : TFmBroadcaster;


    Procedure ShowBroadcaster;
    Procedure ShowMedPosProg;

    procedure Save;Override;
    procedure Savejr;
    procedure Cancel;Override;

    { Public declarations }
  end;

var
  TasOrderBudgetItemPiJr: TTasOrderBudgetItemPiJr;

implementation

{$R *.dfm}

uses MainModule;

{ TTasOrderBudgetItemPiJr }

procedure TTasOrderBudgetItemPiJr.Cancel;
begin
  inherited;
//
end;

procedure TTasOrderBudgetItemPiJr.ClearAllFields;
begin
  inherited;
//
end;

procedure TTasOrderBudgetItemPiJr.EditionControl;
begin
  FrBroadcaster.DBLCB_Lista.ReadOnly := (CodigoRegistro > 0);
  FrMedPosProg.DBLCB_Lista.ReadOnly := (CodigoRegistro > 0);
end;

procedure TTasOrderBudgetItemPiJr.FormatScreen;
begin
  inherited;
  ShowBroadcaster;
  ShowMedPosProg;
end;

function TTasOrderBudgetItemPiJr.getNext: Integer;
Var
  Marcador : TBookmark;
begin
 with cds_Items do
  Begin
    marcador:= GetBookmark;
    try
      DisableControls;
      Result := 0;
      try
        filtered :=False;
        First;
        while not Eof do
        begin
          if FieldByName('id').AsInteger >Result then
            Result :=  fieldbyname('id').AsInteger;
          Next;
        end;
      finally
        filtered :=True;
        EnableControls;
      end;
    finally
      GotoBookmark(marcador);
      FreeBookmark(marcador);
    end;
  End;
  inc(Result);
end;
procedure TTasOrderBudgetItemPiJr.InitVariable;
begin
  inherited;
  //MedPartsJr := TControllerMedPartsJr.Create(Self);
end;

procedure TTasOrderBudgetItemPiJr.Save;
begin
  SaveJr;
end;

procedure TTasOrderBudgetItemPiJr.Savejr;
begin
  if (CodigoRegistro = 0) then  CodigoRegistro := getNext;
  with self.cds_Items do
  Begin
    if not Active then createDataset;
    if EditionState = 'I' then
    Begin
      Append;


      FieldByName('id').AsInteger := CodigoRegistro;
      FieldByName('tb_institution_id').AsInteger    := UMM.GInstitution.registro.Codigo;
      FieldByName('tb_order_id').AsInteger          := 0;
      FieldByName('created_at').AsDateTime          := Date;

    End
    else
    Begin
       Edit;
    End;
      FieldByName('tb_broadcaster_id').AsInteger    := FrBroadcaster.DBLCB_Lista.KeyValue;
      FieldByName('tb_med_pos_prog_id').AsInteger   := FrMedPosProg.DBLCB_Lista.KeyValue;
      FieldByName('day').AsString                   := Cb_Day.Text;
      FieldByName('Color').AsString                 := Cb_Color.Text;
      FieldByName('table_value').AsFloat            := StrToFloatDef(E_table_value.Text, 0);
      FieldByName('aliq_desc').AsFloat              := StrToFloatDef(E_aliq_desc.Text, 0);
      FieldByName('unit_value').AsFloat             := StrToFloatDef(E_unit_value.Text, 0);
      FieldByName('nr_column').AsString             := E_nr_column.Text;
      FieldByName('nr_height').AsString             := E_nr_height.Text;
      FieldByName('insertion').AsString             := E_insertion.Text;
      FieldByName('name_company').AsString          := FrBroadcaster.DBLCB_Lista.Text;
      FieldByName('updated_at').AsDateTime          := date;

    Post;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderBudgetItemPiJr.SB_SaveClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTasOrderBudgetItemPiJr.setVariable;
begin
  if CodigoRegistro > 0 then
  begin
//    //Pecas  Jr
//    MedPartsJr.Registro.Codigo := CodigoRegistro;
//    MedPartsJr.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
//    MedPartsJr.getByKey;
//    //Pecas  Jr
//    MedPartsJr.MedParts.Registro.Codigo := MedPartsJr.Registro.Codigo;
//    MedPartsJr.MedParts.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
//    MedPartsJr.MedParts.getByKey;
    ShowData;
  end
  else
  Begin
    ShowNoData;
  End;
  EditionControl;
end;

procedure TTasOrderBudgetItemPiJr.ShowBroadcaster;
begin
  FrBroadcaster := TFmBroadcaster.Create(Self);
  FrBroadcaster.Parent := Ctn_Brodcaster;
  FrBroadcaster.Align := alClient;
  FrBroadcaster.Listar;
  FrBroadcaster.Show;
end;

procedure TTasOrderBudgetItemPiJr.ShowData;
begin
  inherited;
  with cds_Items do
  begin
    FrBroadcaster.DBLCB_Lista.KeyValue    := FieldByName('tb_broadcaster_id').AsInteger;
    FrMedPosProg.DBLCB_Lista.KeyValue     := FieldByName('tb_med_pos_prog_id').AsInteger;
    Cb_Day.Text                           := FieldByName('day').AsString;
    Cb_Color.Text                         := FieldByName('Color').AsString;
    E_table_value.Text                    := FloatToStrF(FieldByName('table_value').AsFloat, ffFixed,10,2);
    E_aliq_desc.Text                      := FloatToStrF(FieldByName('aliq_desc').AsFloat, ffFixed,10,2);
    E_unit_value.Text                     := FloatToStrF(FieldByName('unit_value').AsFloat, ffFixed,10,2);
    E_nr_column.Text                      := FieldByName('nr_column').AsString;
    E_nr_height.Text                      := FieldByName('nr_height').AsString;
    E_insertion.Text                      := IntToStr(FieldByName('insertion').AsInteger);
  end;
end;

procedure TTasOrderBudgetItemPiJr.ShowDataOrder;
begin
//
end;

procedure TTasOrderBudgetItemPiJr.ShowMedPosProg;
begin
begin
  FrMedPosProg := TFmMedPosProg.Create(Self);
  FrMedPosProg.Parent := Ctn_Med_Pos_Prog;
  FrMedPosProg.Align := alClient;
  FrMedPosProg.Listar;
  FrMedPosProg.Show;
end;
end;

procedure TTasOrderBudgetItemPiJr.ShowNoData;
begin
  inherited;
//
end;

end.
