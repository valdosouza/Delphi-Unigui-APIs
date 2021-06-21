inherited SeaMedParts: TSeaMedParts
  ClientHeight = 379
  ClientWidth = 1004
  Caption = 'Visualiza'#231#227'o de Pe'#231'as'
  ExplicitWidth = 1020
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 1004
    Height = 315
    ExplicitWidth = 1004
    ExplicitHeight = 315
    inherited pc_search: TUniPageControl
      Width = 1000
      Height = 311
      ExplicitWidth = 1000
      ExplicitHeight = 311
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 992
        ExplicitHeight = 283
        inherited pnl_param: TUniPanel
          Width = 992
          Height = 252
          ExplicitWidth = 992
          ExplicitHeight = 252
          object DTP_Date_End: TUniDateTimePicker
            Left = 104
            Top = 21
            Width = 98
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 1
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 5
            Top = 21
            Width = 97
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object ChBx_Periodo: TUniCheckBox
            Left = 6
            Top = 5
            Width = 145
            Height = 13
            Hint = ''
            Caption = 'Periodo data de cadastro'
            TabOrder = 3
          end
          object UniLabel7: TUniLabel
            Left = 5
            Top = 45
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Ve'#237'culo'
            TabOrder = 4
          end
          object E_bd_name_company: TUniEdit
            Left = 5
            Top = 61
            Width = 618
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
          end
        end
        inherited pnl_config: TUniPanel
          Top = 252
          Width = 992
          ExplicitTop = 252
          ExplicitWidth = 992
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 992
        ExplicitHeight = 283
        inherited dbg_Search: TUniDBGrid
          Width = 992
          Height = 283
          Columns = <
            item
              FieldName = 'dt_insertion'
              Title.Caption = 'Data Inser'#231#227'o'
              Width = 89
            end
            item
              FieldName = 'broadcaster'
              Title.Caption = 'Ve'#237'culo '
              Width = 293
              ReadOnly = True
            end
            item
              FieldName = 'advetiser'
              Title.Caption = 'Anunciante'
              Width = 289
              ReadOnly = True
            end
            item
              FieldName = 'tittle'
              Title.Caption = 'T'#237'tulo da Pe'#231'a'
              Width = 184
              ReadOnly = True
            end
            item
              FieldName = 'description'
              Title.Caption = 'Posi'#231#227'o'
              Width = 241
              ReadOnly = True
            end
            item
              FieldName = 'parts_format'
              Title.Caption = 'Formato'
              Width = 338
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 315
    Width = 1004
    ExplicitTop = 315
    ExplicitWidth = 1004
  end
  inherited cds_search: TClientDataSet
    object cds_searchdt_insertion: TDateField
      FieldName = 'dt_insertion'
      Origin = 'dt_insertion'
    end
    object cds_searchbroadcaster: TStringField
      FieldName = 'broadcaster'
      Origin = 'nick_trade'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchadvetiser: TStringField
      FieldName = 'advetiser'
      Origin = 'nick_trade'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchtittle: TStringField
      FieldName = 'tittle'
      Origin = 'tittle'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cds_searchparts_format: TStringField
      FieldName = 'parts_format'
      Origin = 'parts_format'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInKey]
      ReadOnly = True
    end
  end
  inherited MenuTask: TUniMainMenu
    inherited MnuTarefas: TUniMenuItem
      object ImprimirVisualizaoPeas1: TUniMenuItem
        Caption = 'Imprimir Visualiza'#231#227'o Pe'#231'as'
        OnClick = ImprimirVisualizaoPeas1Click
      end
      object ImprmirPI1: TUniMenuItem
        Caption = 'Imprmir P.I.'
        OnClick = ImprmirPI1Click
      end
    end
  end
end
