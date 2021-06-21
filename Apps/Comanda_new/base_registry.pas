unit base_registry;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, FMX.Layouts, FMX.TreeView, FMX.DateTimeCtrls, FMX.ScrollBox,
  FMX.Memo, FMX.ListBox, FMX.Controls.Presentation, FMX.Edit, FMX.Objects,
  FMX.DialogService, System.ImageList, FMX.ImgList;

type
  TBaseRegistry = class(TBaseForm)
    img_top: TImage;
    Lb_title: TLabel;
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Ly_list_titlle: TLayout;
    Ly_quick_search: TLayout;
    E_busca: TEdit;
    Sb_back: TSpeedButton;
    Sb_Cancel: TSpeedButton;
    Sb_Save: TSpeedButton;
    procedure Sb_SaveClick(Sender: TObject);
    procedure Sb_CancelClick(Sender: TObject);
    procedure Sb_searchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Virtual;
    procedure ShowNoData;Virtual;
    procedure ClearAllFields;Virtual;
    function validateSave:Boolean;Virtual;
    procedure save;Virtual;
    function ValidateCancel():boolean;Virtual;
    procedure Cancel;Virtual;
    procedure Search;Virtual;
  public
    { Public declarations }
  end;

var
  BaseRegistry: TBaseRegistry;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses MainModule;

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TBaseRegistry }

procedure TBaseRegistry.Cancel;
begin
  close;
end;

procedure TBaseRegistry.ClearAllFields;
begin
  ClearFields(self);
end;

procedure TBaseRegistry.FormatScreen;
begin
  inherited;

end;

procedure TBaseRegistry.FormCreate(Sender: TObject);
begin
  InitVariable;
end;

procedure TBaseRegistry.FormShow(Sender: TObject);
begin
  setImages;
  FormatScreen; //- estou ativando apos a criação do form
  SetVariable;
end;

procedure TBaseRegistry.InitVariable;
begin
  inherited;

end;

procedure TBaseRegistry.save;
begin

end;

procedure TBaseRegistry.Sb_SaveClick(Sender: TObject);
begin
  if validateSave then
  Begin
    Save;
     ModalResult := mrCancel;
  End;
end;

procedure TBaseRegistry.Sb_searchClick(Sender: TObject);
begin
  inherited;
  Search;
end;

procedure TBaseRegistry.Search;
begin

end;

procedure TBaseRegistry.SetVariable;
begin
  if ( CodigoRegistro > 0 ) then
  Begin
    ShowData;
  End
  else
  Begin
    ShowNoData;
  End;
end;

procedure TBaseRegistry.ShowData;
begin

end;

procedure TBaseRegistry.ShowNoData;
begin

end;

procedure TBaseRegistry.Sb_CancelClick(Sender: TObject);
begin
  if ValidateCancel then
    Cancel;
end;

function TBaseRegistry.ValidateCancel: boolean;
begin
  REsult := True;
end;

function TBaseRegistry.validateSave: Boolean;
begin
  result := True;
end;

end.
