unit fm_BaseFrameUzaa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniGUIClasses, uniPanel,
  uniPageControl, uniGUIBaseClasses;

type
  TBaseFrameUzaa = class(TFrame)

  private
    procedure NovaAba(nomeFormFrame: TFrame; descFormFrame: string; Fechar: Boolean);
    procedure UniClickMain(Sender: TObject);


  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TBaseFrameUzaa.NovaAba(nomeFormFrame: TFrame; descFormFrame: string;
  Fechar: Boolean);
var TabSheet      :TUniTabSheet;
    //FCurrentFrame :TUniFrame;
    I             :Integer;
begin
//      unpgPrincipal.Visible := True;
//
//      {Verificando se a tela já está aberto e redireciona a ela}
//      for I := 0 to unpgPrincipal.PageCount - 1 do
//        with unpgPrincipal do
//          if Pages[I].Caption = descFormFrame  then
//            begin
//              unpgPrincipal.ActivePageIndex := I;
//              Exit;
//            end;
//
//      TabSheet              := TUniTabSheet.Create(Self);
//      TabSheet.PageControl  := unpgPrincipal;
//      TabSheet.Caption      := descFormFrame;
//      TabSheet.Closable     := Fechar;

     // FCurrentFrame:= TUniFrameClass(nomeFormFrame).Create(Self);

      {with FCurrentFrame do
        begin
          Align               := alClient;
          Parent              := TabSheet;
        end;     }

 //     Refresh;

 //     unpgPrincipal.ActivePage := TabSheet;
end;

procedure TBaseFrameUzaa.UniClickMain(Sender: TObject);
begin
   //NovaAba(TFrame(TFmAddress),'FmAddress',True);
end;

end.
