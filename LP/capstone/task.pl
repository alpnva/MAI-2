﻿:- encoding(utf8).

male('Азамат Алапанов').
male('Халиль Алапанов').
male('Салават Алапанов').
male('Артур Байсикин').
male('Исрафиль Рангулов').
male('Газбулла Алапанов').
male('Гаяз Алапанов').
male('Газинур Алапанов').
male('Расиль Амиров').
male('Ралис Амиров').
male('Рифнур Рангулов').
male('Хатмулла Алапанов').
male('Габдулхак Алапанов').
male('Кашфулла Алапанов').
male('Арманша Алапанов').

female('Эльза Алапанова').
female('Рауфа Рангулова').
female('Алина Алапанова').
female('Ирина').
female('Луиза Алапанова').
female('Ирина Байсикина').
female('Хазира').
female('Рауфа').
female('Гульнур Алапанова').
female('Гульнара Рангулова').
female('Юлия').
female('София Рангулова').
female('Факира').
female('Сахия').
female('Хатима Алапанова').

% child(child, parent)
child('Эльза Алапанова', 'Халиль Алапанов').
child('Эльза Алапанова', 'Рауфа Рангулова').
child('Салават Алапанов', 'Халиль Алапанов').
child('Салават Алапанов', 'Рауфа Рангулова').
child('Азамат Алапанов', 'Халиль Алапанов').
child('Азамат Алапанов', 'Рауфа Рангулова').
child('Алина Алапанова', 'Халиль Алапанов').
child('Алина Алапанова', 'Рауфа Рангулова').
child('Луиза Алапанова', 'Халиль Алапанов').
child('Луиза Алапанова', 'Ирина').
child('Ирина Байсикина', 'Луиза Алапанова').
child('Ирина Байсикина', 'Артур Байсикин').
child('Рауфа Рангулова', 'Исрафиль Рангулов').
child('Рауфа Рангулова', 'Хазира').
child('Гульнара Рангулова', 'Исрафиль Рангулов').
child('Гульнара Рангулова', 'Хазира').
child('Рифнур Рангулов', 'Исрафиль Рангулов').
child('Рифнур Рангулов', 'Хазира').
child('Халиль Алапанов', 'Газбулла Алапанов').
child('Халиль Алапанов', 'Факира').
child('Гаяз Алапанов', 'Газбулла Алапанов').
child('Гаяз Алапанов', 'Факира').
child('Газинур Алапанов', 'Рауфа').
child('Газинур Алапанов', 'Гаяз Алапанов').
child('Гульнур Алапанова', 'Рауфа').
child('Гульнур Алапанова', 'Гаяз Алапанов').
child('Ралис Амиров', 'Гульнара Рангулова').
child('Ралис Амиров', 'Расиль Амиров').
child('София Рангулова', 'Юлия').
child('София Рангулова', 'Рифнур Рангулов').
child('Газбулла Алапанов', 'Хатмулла Алапанов').
child('Хатмулла Алапанов', 'Сахия').
child('Хатмулла Алапанов', 'Габдулхак Алапанов').
child('Кашфулла Алапанов', 'Сахия').
child('Кашфулла Алапанов', 'Габдулхак Алапанов').
child('Хатима Алапанова', 'Сахия').
child('Хатима Алапанова', 'Габдулхак Алапанов').
child('Габдулхак Алапанов', 'Арманша Алапанов').

