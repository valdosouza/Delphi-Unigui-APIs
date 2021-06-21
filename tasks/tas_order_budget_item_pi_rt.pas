unit tas_order_budget_item_pi_rt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniGroupBox, uniEdit, uniMultiItem, uniComboBox, uniLabel,Data.DB, Datasnap.DBClient,
  Datasnap.Provider,Fm_Med_Pos_Prog,fm_broadcaster ;

type
  TTasOrderBudgetItemPiRt = class(TBaseRegistry)
    Ctn_Broadcaster: TUniContainerPanel;
    Ctn_Med_Pos_Prog: TUniContainerPanel;
    UniGroupBox1: TUniGroupBox;
    UniEdit9: TUniEdit;
    UniLabel11: TUniLabel;
    UniEdit10: TUniEdit;
    UniLabel12: TUniLabel;
    UniEdit11: TUniEdit;
    UniLabel13: TUniLabel;
    UniEdit12: TUniEdit;
    UniLabel14: TUniLabel;
    UniLabel6: TUniLabel;
    Cb_tm_duration: TUniComboBox;
    UniLabel5: TUniLabel;
    Cb_testimonial: TUniComboBox;
    UniLabel1: TUniLabel;
    E_increase_testemonial: TUniEdit;
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
    { Public declarations }
    cds_Items     : TClientDataSet;
    FrMedPosProg  : TFmMedPosProg;
    FrBroadcaster : TFmBroadcaster;

    Procedure ShowBroadcaster;
    Procedure ShowMedPosProg;

    procedure Save;Override;
    procedure SaveRt;
    procedure Cancel;Override;
  end;

var
  TasOrderBudgetItemPiRt: TTasOrderBudgetItemPiRt;

implementation

{$R *.dfm}

uses MainModule;

{ TTasOrderBudgetItemPiRt }

procedure TTasOrderBudgetItemPiRt.Cancel;
begin
  inherited;
  //
end;

procedure TTasOrderBudgetItemPiRt.ClearAllFields;
begin
  inherited;
  //
end;

procedure TTasOrderBudgetItemPiRt.EditionControl;
begin
  FrBroadcaster.DBLCB_Lista.ReadOnly := (CodigoRegistro > 0);
  FrMedPosProg.DBLCB_Lista.ReadOnly := (CodigoRegistro > 0);
end;

procedure TTasOrderBudgetItemPiRt.FormatScreen;
begin
  inherited;
  ShowBroadcaster;
  ShowMedPosProg;
end;

function TTasOrderBudgetItemPiRt.getNext: Integer;
Var
  Marcador : TBookmark;
begin
 Begin
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
 End;
end;

procedure TTasOrderBudgetItemPiRt.InitVariable;
begin
  inherited;
  //MedPartsJr := TControllerMedPartsJr.Create(Self);
end;

procedure TTasOrderBudgetItemPiRt.Save;
begin
 SaveRt;
end;

procedure TTasOrderBudgetItemPiRt.SaveRt;
begin
    if not cds_Items.active then cds_items.CreateDataSet;
    if (CodigoRegistro = 0) then  CodigoRegistro := getNext;
  with self.cds_Items do
  Begin
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
      FieldByName('tb_broadcaster_id').AsString     := FrBroadcaster.DBLCB_Lista.KeyValue;
      FieldByName('tb_med_pos_prog_id').AsString    := FrMedPosProg.DBLCB_Lista.KeyValue;
      FieldByName('tm_duration').AsString           := Cb_tm_duration.Text;
      FieldByName('testimonial').AsString           := Cb_testimonial.Text;
      FieldByName('increase_testemonial').AsFloat   := StrToFloatDef(E_increase_testemonial.Text, 0);
      FieldByName('name_company').AsString          := FrBroadcaster.DBLCB_Lista.Text;
      FieldByName('updated_at').AsDateTime          := date;

    Post;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderBudgetItemPiRt.SB_SaveClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTasOrderBudgetItemPiRt.setVariable;
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

procedure TTasOrderBudgetItemPiRt.ShowBroadcaster;
begin
  FrBroadcaster := TFmBroadcaster.Create(Self);
  FrBroadcaster.Parent := Ctn_Broadcaster;
  FrBroadcaster.Align := alClient;
  FrBroadcaster.Listar;
  FrBroadcaster.Show;
end;

procedure TTasOrderBudgetItemPiRt.ShowData;
begin
  inherited;
  with cds_Items do
  begin
    FrBroadcaster.DBLCB_Lista.KeyValue    := FieldByName('tb_broadcaster_id').AsInteger;
    FrMedPosProg.DBLCB_Lista.KeyValue     := FieldByName('tb_med_pos_prog_id').AsInteger;
    Cb_tm_duration.Text                   := FieldByName('tm_duration').AsString;
    Cb_testimonial.Text                   := FieldByName('testimonial').AsString;
    E_increase_testemonial.Text           := FieldByName('increase_testemonial').AsString;
  end;
end;

procedure TTasOrderBudgetItemPiRt.ShowDataOrder;
begin
 //
end;

procedure TTasOrderBudgetItemPiRt.ShowMedPosProg;
begin
  FrMedPosProg := TFmMedPosProg.Create(Self);
  FrMedPosProg.Parent := Ctn_Med_Pos_Prog;
  FrMedPosProg.Align := alClient;
  FrMedPosProg.Listar;
  FrMedPosProg.Show;
end;

procedure TTasOrderBudgetItemPiRt.ShowNoData;
begin
  inherited;
 //
end;

end.
