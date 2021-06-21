inherited PrintCompany: TPrintCompany
  ClientHeight = 154
  ClientWidth = 611
  Caption = 'Relat'#243'rio de Empresas'
  ExplicitWidth = 617
  ExplicitHeight = 203
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_Botao: TUniPanel
    Top = 88
    Width = 611
    ExplicitTop = 88
    ExplicitWidth = 611
  end
  inherited pnl_Lista: TUniPanel
    Height = 88
    ExplicitHeight = 88
    inherited Lbx_reports: TUniListBox
      Height = 71
      Items.Strings = (
        'CLIENTE'
        'FORNECEDOR'
        'TRANSPORTADORA')
      ExplicitHeight = 71
    end
  end
  inherited Parâmetros: TUniGroupBox
    Width = 442
    Height = 88
    ExplicitWidth = 442
    ExplicitHeight = 88
    object ctn_state: TUniContainerPanel
      Left = 4
      Top = 21
      Width = 94
      Height = 36
      Hint = ''
      ParentColor = False
      TabOrder = 1
    end
    object ctn_city: TUniContainerPanel
      Left = 104
      Top = 21
      Width = 335
      Height = 36
      Hint = ''
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
end
