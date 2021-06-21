inherited SeaCalled: TSeaCalled
  Width = 839
  Height = 548
  ExplicitWidth = 839
  ExplicitHeight = 548
  object Dbg_search: TUniDBGrid
    Left = 0
    Top = 40
    Width = 839
    Height = 508
    Hint = ''
    DataSource = ds_search
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 0
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = 'Sequencia'
        Width = 64
      end
      item
        FieldName = 'updated_at'
        Title.Caption = 'Data e Hora'
        Width = 169
      end
      item
        FieldName = 'comentario'
        Title.Caption = 'Coment'#225'rio'
        Width = 304
      end
      item
        FieldName = 'situacao'
        Title.Caption = 'Situa'#231#227'o'
        Width = 100
      end>
  end
  object pnl_botao: TUniPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 40
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 613
    object UniButton1: TUniButton
      AlignWithMargins = True
      Left = 81
      Top = 4
      Width = 75
      Height = 32
      Hint = ''
      Margins.Left = 1
      Margins.Right = 1
      Caption = 'Comentar'
      Align = alLeft
      TabOrder = 1
    end
    object UniButton2: TUniButton
      AlignWithMargins = True
      Left = 235
      Top = 4
      Width = 75
      Height = 32
      Hint = ''
      Margins.Left = 1
      Margins.Right = 1
      Caption = 'Proposta'
      Align = alLeft
      TabOrder = 2
    end
    object UniButton3: TUniButton
      AlignWithMargins = True
      Left = 158
      Top = 4
      Width = 75
      Height = 32
      Hint = ''
      Margins.Left = 1
      Margins.Right = 1
      Caption = 'Tarefa'
      Align = alLeft
      TabOrder = 3
    end
    object UniButton4: TUniButton
      AlignWithMargins = True
      Left = 312
      Top = 4
      Width = 75
      Height = 32
      Hint = ''
      Margins.Left = 1
      Caption = 'Progresso'
      Align = alLeft
      TabOrder = 4
    end
    object UniButton5: TUniButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 75
      Height = 32
      Hint = ''
      Margins.Right = 1
      Caption = 'Atualizar'
      Align = alLeft
      TabOrder = 5
    end
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 151
  end
  object cds_search: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 152
    Top = 199
  end
  object ds_search: TDataSource
    DataSet = cds_search
    Left = 152
    Top = 246
  end
end
