unit ControllerBroacasterHasCirculation;

interface
uses System.Classes, System.SysUtils,BaseController,tblBroacasterHasCirculaton,
      Md5, FireDAC.Stan.Param, System.Generics.Collections,intCity,
      Datasnap.DBClient, Data.DB, FireDAC.Comp.Client,intBroadcasterHasCirculation;

Type
  TListaIntCoverage = TObjectList<TIntBroadcasterHasCirculation>;
  TListaIntCity = TObjectList<TIntCity>;

  TControllerBroacasterHasCirculation = Class(TBaseController)
    procedure clear;
  private


  public
    Registro : TBroacasterHasCirculation;
    ListaIntCoerage: TListaIntCoverage;
    ListaIntCity: TListaIntCity;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;
    procedure getListInterface;
    procedure getListIntCity(TipoMidia:String);
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;
    function getByKey:Boolean;
    function getTiragem:Integer;
  End;

implementation

{ TControllerBroacasterHasCirculation }

procedure TControllerBroacasterHasCirculation.clear;
begin

end;

constructor TControllerBroacasterHasCirculation.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TBroacasterHasCirculation.Create;
  ListaIntCoerage := TListaIntCoverage.Create;
  ListaIntCity  := TListaIntCity.create;
end;

function TControllerBroacasterHasCirculation.delete: boolean;
begin
  try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  end;

end;

destructor TControllerBroacasterHasCirculation.Destroy;
begin
  ListaIntCoerage.DisposeOf;
  ListaIntCity.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerBroacasterHasCirculation.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerBroacasterHasCirculation.getList;
begin

end;

procedure TControllerBroacasterHasCirculation.getListIntCity(TipoMidia:String);
var
  Lc_Qry : TFDQuery;
  Lc_Item : TIntCity;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      if (TipoMidia ='I') or (TipoMidia ='A') then
      Begin
        sql.add(concat(
                    'select distinct c.id, UPPER(c.name) name ',
                    'from tb_med_price_list_jr pjr ',
                    '    inner join tb_broadcaster b ',
                    '    on ( pjr.tb_broadcaster_id = b.id ) ',
                    '      and ( pjr.tb_institution_id = b.tb_institution_id) ',
                    '    inner join tb_address adr ',
                    '    on (adr.id = b.id) ',
                    '    inner join tb_city c ',
                    '    on (c.id =adr.tb_city_id) ',
                    'where pjr.online_price >0 '
        ));
      End;
      if (TipoMidia ='A') then
        sql.add(  'union ');


      if (TipoMidia ='O') or (TipoMidia ='A') then
      Begin
        sql.add(concat(
                  'select distinct c.id, UPPER(c.name) name ',
                  'from tb_med_price_list_ol pol ',
                  '    inner join tb_broadcaster b ',
                  '    on (pol.tb_broadcaster_id = b.id) ',
                  '      and (pol.tb_institution_id = b.tb_institution_id) ',
                  '    inner join tb_address adr ',
                  '    on (adr.id = b.id) ',
                  '    inner join tb_city c ',
                  '    on (c.id =adr.tb_city_id) ',
                  'where pol.online_price >0 '
        ));
      End;
      sql.add('ORDER BY 2 asc ');
      Active := True;
      FetchAll;
      First;
      ListaIntCity.Clear;
      while not eof do
      Begin
        Lc_Item := TIntCity.Create;
        Lc_Item.Codigo      := FieldByName('id').AsInteger;
        Lc_Item.Nome  := FieldByName('name').AsString;
        Lc_Item.Selecao     := 'N';
        ListaIntCity.add(Lc_Item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

procedure TControllerBroacasterHasCirculation.getListInterface;
var
  Lc_Qry : TFDQuery;
  Lc_Item : TIntBroadcasterHasCirculation;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'Select tb_broadcaster_id, tb_city_id, upper(c.name) name, ',
                ' c.tb_state_id, c.population, bhc.number      ',
                'from tb_broadcaster_has_circulation bhc       ',
                '  inner join tb_city c                        ',
                '  on (c.id = bhc.tb_city_id)                  ',
                'Where tb_broadcaster_id =:tb_broadcaster_id   ',
                'order by c.name asc '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('tb_broadcaster_id').AsInteger := Registro.Veiculo;
      Active := True;
      FetchAll;
      First;
      ListaIntCoerage.Clear;
      while not eof do
      Begin
        Lc_Item := TIntBroadcasterHasCirculation.Create;
        Lc_Item.Estado      := FieldByName('tb_state_id').AsInteger;
        Lc_Item.Cidade      := FieldByName('tb_city_id').AsInteger;
        Lc_Item.DescCidade  := FieldByName('name').AsString;
        Lc_Item.Veiculo     := FieldByName('tb_broadcaster_id').AsInteger;
        Lc_Item.Populacao   := FieldByName('population').AsInteger;
        Lc_Item.Numero      := FieldByName('number').AsInteger;
        ListaIntCoerage.add(Lc_Item);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TControllerBroacasterHasCirculation.getTiragem: Integer;
var
  Lc_Qry : TFDQuery;
  Lc_Item : TIntBroadcasterHasCirculation;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat(
                'Select sum(number) total ',
                'from tb_broadcaster_has_circulation bhc       ',
                'Where tb_broadcaster_id =:tb_broadcaster_id   '
      //        ' and ( tb_city_id =:tb_city_id ) '
      ));

      //Incrementa SQL

      //Passagem de parametros
      parambyname('tb_broadcaster_id').AsInteger := Registro.Veiculo;
//      parambyname('tb_city_id').AsInteger := Registro.Cidade;
      Active := True;
      FetchAll;
      Result := FieldByName('total').AsInteger;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TControllerBroacasterHasCirculation.insert: boolean;
begin
  try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  end;

end;

function TControllerBroacasterHasCirculation.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  end;
end;

function TControllerBroacasterHasCirculation.update: boolean;
begin
  try
    updateObj(Registro);
    Result := True;
  Except
    Result := False;
  end;

end;

end.
