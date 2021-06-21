unit sea_customer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Controls.Presentation, FMX.Layouts, fm_sea_customer,
  FMX.ListView.Appearances, cad_entity;

type
  TSeaCustomer = class(TBaseForm)
    FmSeaCustomer: TFmSeaCustomer;
    procedure FormCreate(Sender: TObject);
    procedure FmSeaCustomerSb_InsertClick(Sender: TObject);
    procedure FmSeaCustomerlsv_SearchItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FmSeaCustomerSb_back_callbackClick(Sender: TObject);
  private

  protected
    procedure openCad(CodeId:Integer);
    procedure getItem(AItem: TListViewItem);
    procedure InitVariable;Override;
    procedure FormatScreen;Override;
  public
    CodigoCliente : Integer;
    NameCliente : String;
    NickCliente : String;
  end;


var
  SeaCustomer: TSeaCustomer;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TBaseForm1 }


procedure TSeaCustomer.FmSeaCustomerlsv_SearchItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  getItem(Aitem);
end;

procedure TSeaCustomer.FmSeaCustomerSb_back_callbackClick(Sender: TObject);
begin

  ModalResult := mrCancel;
end;

procedure TSeaCustomer.FmSeaCustomerSb_InsertClick(Sender: TObject);
begin
  opencad(0);
end;

procedure TSeaCustomer.FormatScreen;
begin
  inherited;

end;

procedure TSeaCustomer.FormCreate(Sender: TObject);
begin
  inherited;
  InitVariable;
end;

procedure TSeaCustomer.getItem(AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
begin
  if FmSeaCustomer.Sb_back_callback.Visible then
  Begin
    LcLVI := FmSeaCustomer.lsv_Search.Items[AItem.Index];
    CodigoCliente := StrToInt(AItem.Text);
    NameCliente := LcLVI.Data['Nome'].AsString;
    NickCliente := LcLVI.Data['Fantasia'].AsString;
    self.ModalResult := mrOk;
  end
  else
  Begin

    OpenCad(StrToInt(AItem.Text));
  End;
end;

procedure TSeaCustomer.InitVariable;
begin
  inherited;
  SetMainStock;
  FmSeaCustomer.InitVariable;
  FmSeaCustomer.getList('');


end;

procedure TSeaCustomer.openCad(CodeId: Integer);
Var
  Form : TCadEntity;
begin
  Form := TCadEntity.Create(Application);
  Form.CodigoRegistro := 0;
  Form.Parent := Self;
  Form.CodigoRegistro := CodeId;
  Form.ShowModal(
  procedure(ModalResult : TModalResult)
  begin
    FmSeaCustomer.getlist('');
    form := nil;
  end);
end;

end.
