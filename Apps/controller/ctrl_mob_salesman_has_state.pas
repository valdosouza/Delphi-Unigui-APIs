unit ctrl_mob_salesman_has_state;

interface

uses System.Classes,ctrl_mob_base, System.SysUtils,
  FireDAC.Comp.Client, tblSalesmanHasState;

Type
  TCtrlMobSalesmanHasState = class(TCtrlMobBase)
    private

    public
      Registro : TSalesmanHasState;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
  end;

implementation

{ TCtrlMobSalesmanHasState }

constructor TCtrlMobSalesmanHasState.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TSalesmanHasState.Create;
  createTable;
end;

procedure TCtrlMobSalesmanHasState.createTable;
begin
  execcmd(concat(
                'CREATE TABLE tb_salesman_has_state ( ',
                '  tb_institution_id int(11) NOT NULL , ',
                '  tb_salesman_id int(11) NOT NULL, ',
                '  tb_state_id int(11) NOT NULL, ',
                '  created_at datetime, ',
                '  updated_at datetime, ',
                '  PRIMARY KEY (tb_institution_id,tb_salesman_id,tb_state_id)) '
      ));
end;

destructor TCtrlMobSalesmanHasState.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  inherited;
  {$ENDIF }
end;

function TCtrlMobSalesmanHasState.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := TRue;
  Except
    Result := FAlse
  end;
end;

end.
