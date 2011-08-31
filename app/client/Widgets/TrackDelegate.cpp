
#include <QPainter>

#include <lastfm/Track>

#include "../Services/ScrobbleService/ScrobbleService.h"
#include "../ActivityListModel.h"

#include "TrackDelegate.h"

TrackDelegate::TrackDelegate( QObject* parent )
    :QStyledItemDelegate( parent )
{
}

void
TrackDelegate::paint( QPainter* painter, const QStyleOptionViewItem& option, const QModelIndex& index ) const
{
    const QImage& image = index.data( Qt::DecorationRole ).value<QImage>();
    QLinearGradient g( option.rect.topLeft(), option.rect.bottomLeft());
    g.setColorAt( 0, QColor( 0xeeeeee ) );
    g.setColorAt( 1, QColor( 0xdddddd ) );
    painter->fillRect( option.rect, g );

    painter->setPen(QColor(0xaaaaaa));
    painter->drawLine( option.rect.bottomLeft(), option.rect.bottomRight());

    painter->drawImage( option.rect.topLeft() + QPoint( 20, 10 ), image );

    QFont f;
    f.setBold( true );
    f.setPointSize( 13 );
    painter->setPen( QColor(0x333333) );
    painter->setFont( f );

    QFontMetrics fm( f );

    painter->setPen( QColor(0x333333) );
    QString trackTitle = fm.elidedText( index.data( ActivityListModel::TrackNameRole ).toString(), Qt::ElideRight, option.rect.width() - 94 );
    painter->drawText( option.rect.left() + 94, option.rect.top() + 23, trackTitle );
    f.setBold( false );
    painter->setFont( f );
    painter->setPen( QColor(0x333333) );
    QString artist = fm.elidedText( index.data( ActivityListModel::ArtistNameRole ).toString(), Qt::ElideRight, option.rect.width() - 94 );
    painter->drawText( option.rect.left() + 94, option.rect.top() + 43, artist );

    painter->setPen( QColor(0x777777) );

    QDateTime timestamp = index.data( ActivityListModel::TimeStampRole ).toDateTime();
    Track track = index.data( ActivityListModel::TrackRole ).value<Track>();
    QString timestampString = timestamp.toTime_t() == 0 || track.sameObject( ScrobbleService::instance().currentTrack() ) ? tr( "Now playing" ) : prettyTime( timestamp );

    f.setPointSize( 11 );
    painter->setFont( f );
    painter->drawText( option.rect.left() + 94, option.rect.bottom() - 12, timestampString );
}

QString
TrackDelegate::prettyTime( const QDateTime& timestamp ) const
{
    QString dateFormat( "d MMM h:mmap" );
    QDateTime now = QDateTime::currentDateTime();
    int secondsAgo = timestamp.secsTo( now );

    if ( secondsAgo < (60 * 60) )
    {
        // Less than an hour ago
        int minutesAgo = ( timestamp.secsTo( now ) / 60 );
        return (minutesAgo == 1 ? tr( "%1 minute ago" ) : tr( "%1 minutes ago" ) ).arg( QString::number( minutesAgo ) );
    }
    else if ( secondsAgo < (60 * 60 * 6) || now.date() == timestamp.date() )
    {
        // Less than 6 hours ago or on the same date
        int hoursAgo = ( timestamp.secsTo( now ) / (60 * 60) );
        return (hoursAgo == 1 ? tr( "%1 hour ago" ) : tr( "%1 hours ago" ) ).arg( QString::number( hoursAgo ) );
    }
    else
    {
        return timestamp.toString( dateFormat );
        // We don't need to set the timer because this date will never change
    }
}