//
//  SDYsections.m
//  sectionsForTable
//
//  Created by Keith on 16/4/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SDYsections.h"

@implementation SDYsections
- (instancetype)init {
    self = [super init];
    if (self) {
        _sections = [NSMutableArray array];
    }
    return self;
}

- (SDYRow *)rowWithIndexPath:(NSIndexPath *)indexPath {
    SDYSection *sec = [self sectionWithIndexPathSection:indexPath.section];
    if (sec) {
        SDYRow *row = [sec rowAtIndexPathRow:indexPath.row];
        if (row == nil) {
            row = [[SDYRow alloc] init];
            row.sectionKey = sec.sectionKey;
            row.rowKey = -99999;
        }
        return row;
    }
    return nil;
}

- (SDYSection *)sectionWithIndexPathSection:(NSInteger)section {
    if (self.sections.count > section) {
        SDYSection *sec = self.sections[section];
        return sec;
    }
    return nil;
}

- (NSIndexPath *)indexPathWithRowKey:(NSInteger)rowKey {
    for (int s = 0; s < self.sections.count; s++) {
        SDYSection *sec = self.sections[s];
        for (int r = 0; r < sec.rows.count; r++) {
            SDYRow *row = sec.rows[r];
            if (row.rowKey == rowKey) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:r inSection:s];
                return indexPath;
            }
        }
    }
    return nil;
}

- (NSIndexPath *)indexPathWithSectionKey:(NSInteger)sectionKey rowKey:(NSInteger)rowKey {
    for (int s = 0; s < self.sections.count; s++) {
        SDYSection *sec = self.sections[s];
        for (int r = 0; r < sec.rows.count; r++) {
            SDYRow *row = sec.rows[r];
            if ((row.sectionKey == sectionKey) && (row.rowKey == rowKey)) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:r inSection:s];
                return indexPath;
            }
        }
    }
    return nil;
}

- (NSInteger)indexPathSectionWithSectionKey:(NSInteger)sectionKey {
    for (int s = 0; s < self.sections.count; s++) {
        SDYSection *sec = self.sections[s];
        if (sec.sectionKey == sectionKey) {
            return s;
        }
    }
    return -1;
}

- (void)addSection:(SDYSection *)section {
    [self.sections addObject:section];
}

- (void)addSectionKey:(NSInteger)sectionKey rowKey:(NSInteger)rowKey {
    SDYSection *sec = [self sectionWithSectionKey:sectionKey];
    if (sec) {
        [sec addRowKey:rowKey];
    } else {
        sec = [[SDYSection alloc] initWithSectionKey:sectionKey];
        [sec addRowKey:rowKey];
        [self addSection:sec];
    }
}

- (SDYSection *)sectionWithSectionKey:(NSInteger)sectionKey {
    for (SDYSection *sec in self.sections) {
        if (sec.sectionKey == sectionKey) {
            return sec;
        }
    }
    return nil;
}

@end

@implementation SDYSection

- (instancetype)initWithSectionKey:(NSInteger)sectionKey {
    self = [super init];
    if (self) {
        _sectionKey = sectionKey;
        _rows = [NSMutableArray array];
    }
    return self;
}

- (void)addRowKey:(NSInteger)rowKey {
    SDYRow *row = [[SDYRow alloc] init];
    row.sectionKey = self.sectionKey;
    row.rowKey = rowKey;
    [self.rows addObject:row];
}

- (SDYRow *)rowAtIndexPathRow:(NSInteger)row {
    if (self.rows.count > row) {
        return self.rows[row];
    }
    return nil;
}

- (NSInteger)rowKeyAtIndexPathRow:(NSInteger)row {
    if (self.rows.count > row) {
        return self.rows[row].rowKey;
    }
    return -1;
}

@end

@implementation SDYRow

@end
