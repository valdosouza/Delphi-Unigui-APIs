inherited SeaOrderSale: TSeaOrderSale
  ClientWidth = 817
  Caption = 'SeaOrderSale'
  ExplicitWidth = 833
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 817
    ExplicitLeft = -8
    inherited dbg_Search: TUniDBGrid
      Width = 813
      Columns = <>
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Width = 817
    object UniGroupBox1: TUniGroupBox
      Left = 2
      Top = 2
      Width = 813
      Height = 105
      Hint = ''
      Caption = 'Digite sua Op'#231#227'o de busca'
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ExplicitTop = 1
      ExplicitWidth = 885
      DesignSize = (
        813
        105)
      object L_Codigo: TUniLabel
        Left = 213
        Top = 18
        Width = 32
        Height = 14
        Hint = ''
        Caption = 'Ordem'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 1
      end
      object E_Number: TUniEdit
        Left = 212
        Top = 34
        Width = 102
        Hint = ''
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
      object chbx_periodo: TUniCheckBox
        Left = 4
        Top = 16
        Width = 205
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Data Inicial            Data Final'
        TabOrder = 3
      end
      object DTP_Date_Initial: TUniDateTimePicker
        Left = 5
        Top = 34
        Width = 100
        Hint = ''
        DateTime = 42916.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 4
      end
      object DTP_Date_End: TUniDateTimePicker
        Left = 109
        Top = 34
        Width = 100
        Hint = ''
        DateTime = 42916.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 5
      end
      object RG_approved: TUniRadioGroup
        Left = 3
        Top = 62
        Width = 308
        Height = 41
        Hint = ''
        Items.Strings = (
          'Aprovado'
          'Pendente'
          'Todos')
        ItemIndex = 2
        Anchors = [akLeft, akBottom]
        Caption = 'Situ'#231#227'o do Pedido'
        TabOrder = 6
        Columns = 3
      end
      object ctn_Provider: TUniContainerPanel
        Left = 317
        Top = 18
        Width = 488
        Height = 38
        Hint = ''
        ParentColor = False
        TabOrder = 7
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 817
  end
end
