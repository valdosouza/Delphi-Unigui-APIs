unit VertScrollBoxWithKBHandling;

interface
uses
  System.Types, System.Classes,FMX.Layouts, FMX.Controls, System.Math, FMX.forms, FMX.types;


type
  TVertScrollBox = class(FMX.Layouts.TVertScrollBox)
  private
    FOldCalcContentBoundsProc:TOnCalcContentBoundsEvent;
    FOldVKShow,FOldVKHidd:TVirtualKeyboardEvent;
    FOldFocusChanged:TNotifyEvent;
    FOwnerForm:TCommonCustomForm;
  protected
    FKBBounds: TRectF;
    function DoCalcContentBounds: TRectF; override;
    procedure UpdateKBBounds;
    procedure FormVirtualKeyboardHidden(Sender: TObject;KeyboardVisible: Boolean;const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;KeyboardVisible: Boolean;const Bounds: TRect);
    procedure FormFocusChanged(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{ TVertScrollBox }

constructor TVertScrollBox.Create(AOwner: TComponent);
begin
  inherited;
  FOwnerForm:=(Owner as TCommonCustomForm);
  FOldVKShow:=FOwnerForm.OnVirtualKeyboardShown;
  FOwnerForm.OnVirtualKeyboardShown:=FormVirtualKeyboardShown;
  FOldVKHidd:=FOwnerForm.OnVirtualKeyboardHidden;
  FOwnerForm.OnVirtualKeyboardHidden :=FormVirtualKeyboardHidden;
  FOldCalcContentBoundsProc:=OnCalcContentBounds;
  FOldFocusChanged:=FOwnerForm.OnFocusChanged;
  FOwnerForm.OnFocusChanged:=FormFocusChanged;
end;

function TVertScrollBox.DoCalcContentBounds: TRectF;
begin
  if Assigned(FOldCalcContentBoundsProc) then FOldCalcContentBoundsProc(Self,Result);
  Result.Bottom := Max(ContentBounds.Bottom,2 * ClientHeight - FKBBounds.Top);
end;

procedure TVertScrollBox.UpdateKBBounds;
var LFocusRect: TRectF;
    Y:Single;
begin
  Y:=0;
  if Assigned(FOwnerForm.Focused) then
  begin
    LFocusRect := TControl(FOwnerForm.Focused.GetObject).AbsoluteRect;
    LFocusRect.Offset(Self.ViewportPosition);
    if (LFocusRect.IntersectsWith(TRectF.Create(FKBBounds)))
    and (LFocusRect.Bottom > FKBBounds.Top) then Y:=LFocusRect.Bottom - FKBBounds.Top;
  end;
  Self.ViewportPosition := PointF(Self.ViewportPosition.X, Y);
  Self.RealignContent;
  Application.ProcessMessages;
end;

procedure TVertScrollBox.FormFocusChanged(Sender: TObject);
begin
  if Assigned(FOldFocusChanged) then FOldFocusChanged(Sender);
  UpdateKBBounds;
end;

procedure TVertScrollBox.FormVirtualKeyboardHidden(Sender: TObject;KeyboardVisible: Boolean;const Bounds: TRect);
begin
  if  assigned(FOldVKHidd) then FOldVKHidd(Self,KeyboardVisible,Bounds);
  FKBBounds.Create(0, 0, 0, 0);
  UpdateKBBounds;
end;

procedure TVertScrollBox.FormVirtualKeyboardShown(Sender: TObject;KeyboardVisible: Boolean;const Bounds: TRect);
begin
  if  assigned(FOldVKShow) then FOldVKShow(Self,KeyboardVisible,Bounds);
  FKBBounds := TRectF.Create(Bounds);
  FKBBounds.TopLeft :=  FOwnerForm.ScreenToClient(FKBBounds.TopLeft);
  FKBBounds.BottomRight := FOwnerForm.ScreenToClient(FKBBounds.BottomRight);
  UpdateKBBounds;
end;

end.
