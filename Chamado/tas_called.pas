unit tas_called;

interface

uses  base_frame, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniLabel, System.Classes, Vcl.Controls, Vcl.Forms,
  uniGUIBaseClasses, uniPanel, uniGUIApplication;

type
    TTasCalled = class(TBaseFrame)
    Dbg_Iteracao: TUniDBGrid;
    ds_iteracao: TDataSource;
    Qr_Iteracao: TFDQuery;
    pnl_button: TUniPanel;
    UniButton1: TUniButton;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }

    procedure search;
  protected

    procedure setImages;override;
    procedure InitVariable;override;
    procedure FormatScreen;override;
    Procedure geralog(acesso : string);

  public
    { Public declarations }

    NumeroAtendimento : Integer;
    procedure setVariable;override;
  end;

implementation

{$R *.dfm}

uses cad_called;


{ TTasCalled }

procedure TTasCalled.FormatScreen;
begin

end;

procedure TTasCalled.geralog(acesso: string);
begin

end;

procedure TTasCalled.InitVariable;
begin

end;


procedure TTasCalled.search;
begin

end;

procedure TTasCalled.setImages;
begin

end;

procedure TTasCalled.setVariable;
begin

end;

procedure TTasCalled.UniButton1Click(Sender: TObject);
var
 form : TCadCalled;
begin
  form := TCadCalled.create(UniApplication);
 Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      form.disposeof;
    end
  );
end;

end.
