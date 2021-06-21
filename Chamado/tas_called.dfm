inherited TasCalled: TTasCalled
  Width = 548
  inherited pnl_Top: TUniPanel
    Width = 548
  end
  object Dbg_Iteracao: TUniDBGrid
    Left = 0
    Top = 73
    Width = 548
    Height = 231
    Hint = ''
    DataSource = ds_iteracao
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 1
    Columns = <
      item
        FieldName = 'dt_record'
        Title.Caption = 'dt_record'
        Width = 74
      end
      item
        FieldName = 'comentario'
        Title.Caption = 'comentario'
        Width = 304
      end
      item
        FieldName = 'situacao'
        Title.Caption = 'situacao'
        Width = 604
      end>
  end
  object pnl_button: TUniPanel
    Left = 0
    Top = 33
    Width = 548
    Height = 40
    Hint = ''
    Align = alTop
    TabOrder = 2
    Caption = ''
    ExplicitWidth = 451
    object UniButton1: TUniButton
      Left = 11
      Top = 9
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Comentar'
      TabOrder = 1
      OnClick = UniButton1Click
    end
  end
  object ds_iteracao: TDataSource
    DataSet = Qr_Iteracao
    Left = 256
    Top = 248
  end
  object Qr_Iteracao: TFDQuery
    Connection = UMM.DB
    SQL.Strings = (
      
        'select o.dt_record, i.description comentario, s.description situ' +
        'acao'
      'from tb_iteration i'
      '   inner join tb_order o '
      '  on (o.id = i.tb_order_id)'
      '  inner join tb_situation s'
      '  on (s.id = i.tb_situation_id)'
      'where o.tb_institution_id = 1')
    Left = 256
    Top = 193
  end
end
