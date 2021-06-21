unit base_form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.DateTimeCtrls, FMX.ListBox,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.Objects, System.ImageList, FMX.ImgList;

type
  TBaseForm = class(TForm)
    LayoutMain: TLayout;
    ImageList: TImageList;

  private
    { Private declarations }
  protected

    procedure Workinkmsg(Parent:TFmxObject; Working: Boolean);
    procedure ClearFields(T: TComponent);
    procedure InitVariable;Virtual;
    procedure SetVariable;Virtual;
    procedure setImages;Virtual;
    procedure FormatScreen;Virtual;
    procedure LoadLoginForm;
    procedure LoadMainForm;
    procedure LoadSincronize;
    procedure LayoutAjustment;
  public
    { Public declarations }
    CodigoRegistro : Variant;
  end;

var
  BaseForm: TBaseForm;

const
  EOL = concat(Char(10),Char(13));
implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses  uMain;

{ TBaseForm }

procedure TBaseForm.ClearFields(T: TComponent);
begin

end;

procedure TBaseForm.FormatScreen;
BEgin

end;



procedure TBaseForm.InitVariable;
begin

end;



procedure TBaseForm.LayoutAjustment;
begin

end;

procedure TBaseForm.LoadLoginForm;
Var
  Frm : TLogin;
begin
  Frm := TLogin.Create(Application);
  Frm.Show;
  Application.MainForm := frm;
end;

procedure TBaseForm.LoadMainForm;
Var
  Frm : TMain;
begin
  Frm := TMain.Create(Application);
  Frm.Show;
  Application.MainForm := frm;
end;

procedure TBaseForm.LoadSincronize;
begin

end;

procedure TBaseForm.setImages;
begin

end;

procedure TBaseForm.SetVariable;
begin

end;

procedure TBaseForm.Workinkmsg(Parent:TFmxObject; Working: Boolean);
begin
end;

end.


