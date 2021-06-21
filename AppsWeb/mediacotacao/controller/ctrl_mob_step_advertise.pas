unit ctrl_mob_step_advertise;

interface

uses Generics.Collections,step_advertise,  ControllerBudgAdvertise, System.Classes;

Type
  TListaStep = TObjectList<TStepAdvertise>;

  TCtrlMmobStepAdvertise = class(TComponent)
    private
      FListaStep : TListaStep;
      FEscolha: String;
      FPasso: Integer;
      procedure setFListaStep(const Value: TListaStep);

      procedure setFEscolha(const Value: String);
      procedure setFPassso(const Value: Integer);

    public
      Advertise : TControllerBudgAdvertise;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      property ListaStep : TListaStep read FListaStep write setFListaStep;
      property Escolha : String read FEscolha write setFEscolha;
      Property Passo: Integer read FPasso write setFPassso;
  end;
implementation

{ TCtrlMmobStepAdvertise }


constructor TCtrlMmobStepAdvertise.Create(AOwner: TComponent);
begin
  FListaStep := TListaStep.Create;
  Advertise := TControllerBudgAdvertise.Create(Self);
end;

destructor TCtrlMmobStepAdvertise.Destroy;
begin
  FListaStep.DisposeOf;
end;


procedure TCtrlMmobStepAdvertise.setFEscolha(const Value: String);
begin
  FEscolha := Value;
end;

procedure TCtrlMmobStepAdvertise.setFListaStep(const Value: TListaStep);
begin
  FListaStep := Value;
end;

procedure TCtrlMmobStepAdvertise.setFPassso(const Value: Integer);
begin
  FPasso := Value;
end;

end.
