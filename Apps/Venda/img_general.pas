unit img_general;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_form, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Controls.Presentation, FMX.Ani, FMX.Layouts, FMX.Effects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TImgGeneral = class(TBaseForm)
    Image: TImage;
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Ly_list_titlle: TLayout;
    Lb_title: TLabel;
    Sb_Cancel: TSpeedButton;
    ShadowEffect3: TShadowEffect;
    procedure Sb_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
    PathExe : String ;
  end;

var
  ImgGeneral : TImgGeneral;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TImgGeneral.FormShow(Sender: TObject);
begin
  inherited;
  InitVariable;
end;

procedure TImgGeneral.InitVariable;
begin
  inherited;
  Image.Bitmap.LoadFromFile(PathExe);
end;

procedure TImgGeneral.Sb_CancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;


end.
