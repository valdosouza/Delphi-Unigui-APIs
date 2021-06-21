unit tas_take_picture;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.MediaLibrary.Actions, FMX.StdActns,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Media, base_form,
  System.ImageList, FMX.ImgList, FMX.Ani, FMX.Layouts, FMX.Objects, FMX.Effects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;


type
  TTasTakePicture = class(TBaseForm)
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    Imagem: TImage;
    Sb_Picture: TSpeedButton;
    Sb_Save: TSpeedButton;
    Sb_Exit: TSpeedButton;
    Ly_picture_top: TLayout;
    Rc_picture_top: TRectangle;
    ShadowEffect1: TShadowEffect;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure Sb_ExitClick(Sender: TObject);
    procedure Sb_SaveClick(Sender: TObject);
    procedure Sb_PictureClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;

  public
    { Public declarations }
  end;

var
  TasTakePicture: TTasTakePicture;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TTasTakePicture.FormatScreen;
begin
  inherited;

end;

procedure TTasTakePicture.InitVariable;
begin
  inherited;

end;

procedure TTasTakePicture.Sb_ExitClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TTasTakePicture.Sb_PictureClick(Sender: TObject);
begin
  inherited;
  TakePhotoFromCameraAction1.ExecuteTarget(Imagem);
end;

procedure TTasTakePicture.Sb_SaveClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TTasTakePicture.SetVariable;
begin
  inherited;

end;

procedure TTasTakePicture.TakePhotoFromCameraAction1DidFinishTaking(
  Image: TBitmap);
begin
  inherited;
  Imagem.Bitmap.Assign(Image);
end;

end.
