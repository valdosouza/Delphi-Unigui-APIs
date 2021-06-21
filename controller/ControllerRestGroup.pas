unit ControllerRestGroup;

interface
uses System.Classes, System.SysUtils,BaseController,
      Md5, FireDAC.Stan.Param,tblRestGroup, FireDAC.Comp.Client;

Type

  TControllerRestGroup = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TRestGroup;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;

    function getByKey:Boolean;
    function getByDescription:Boolean;
  End;

implementation

procedure TControllerRestGroup.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerRestGroup.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TRestGroup.Create;
end;

function TControllerRestGroup.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerRestGroup.Destroy;
begin
  Registro.disposeOf;
  inherited;
end;


function TControllerRestGroup.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestGroup.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerRestGroup.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerRestGroup.getByDescription: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'select * ',
              'from tb_rest_group g ',
              'where g.description =:description ',
              ' and ( tb_institution_id =:tb_institution_id) '
              ));
      paramByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      paramByName('description').asString       := Registro.Descricao;
      Lc_Qry.Active := True;
      Lc_Qry.FetchAll;
      exist  := ( Lc_Qry.RecordCount > 0 );
      if exist then get(Lc_Qry,Registro) ;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;


end;

function TControllerRestGroup.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
